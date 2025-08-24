unit Ian.Config;

interface

uses
  System.SysUtils, System.Classes, System.IniFiles, System.IOUtils;

const
  CONFIG_FILE = 'options.ini';

type
  TGameConfig = record
    MusicEnabled: Boolean;
    SfxEnabled: Boolean;
    Fullscreen: Boolean; // added to support display option referenced elsewhere
  end;

procedure LoadConfig(var AConfig: TGameConfig); overload;
function LoadConfig: TGameConfig; overload;
procedure SaveConfig(const AConfig: TGameConfig);
procedure ResetConfigToDefaults(var AConfig: TGameConfig);
function GetConfigFilePath: string;

implementation

function GetConfigFilePath: string;
var
  baseDir: string;
begin
  // Prefer Documents path which maps correctly on Windows/macOS/Linux/iOS/Android
  baseDir := '';
  try
    baseDir := TPath.GetDocumentsPath;
  except
    baseDir := '';
  end;

  // Fallback: if for some reason it's empty or not writable, use HomePath
  if (baseDir = '') or (not DirectoryExists(baseDir)) then
  begin
    try
      baseDir := TPath.GetHomePath;
    except
      baseDir := '';
    end;
    // attempt to create a subdirectory for the app
    if baseDir <> '' then
    begin
      try
        baseDir := TPath.Combine(baseDir, 'Find-the-Hidden-Objects-game');
        if not DirectoryExists(baseDir) then
          TDirectory.CreateDirectory(baseDir);
      except
        // If this fails, we'll fall back below
        baseDir := '';
      end;
    end;
  end
  else
  begin
    // Try to create app-specific folder inside Documents to keep things tidy
    try
      baseDir := TPath.Combine(baseDir, 'Find-the-Hidden-Objects-game');
      if not DirectoryExists(baseDir) then
        TDirectory.CreateDirectory(baseDir);
    except
      baseDir := '';
    end;
  end;

  if baseDir = '' then
  begin
    // last resort: use current executable path or current working directory
    try
      baseDir := ExtractFilePath(ParamStr(0));
    except
      baseDir := '';
    end;
    if baseDir = '' then
    begin
      try
        baseDir := TDirectory.GetCurrentDirectory;
      except
        baseDir := '.';
      end;
    end;
  end;

  // ensure the directory exists (best-effort)
  if (baseDir <> '') and (not DirectoryExists(baseDir)) then
  begin
    try
      TDirectory.CreateDirectory(baseDir);
    except
      // ignore - we'll still return something
    end;
  end;

  if baseDir = '' then
    baseDir := '.'; // absolute last resort

  Result := TPath.Combine(baseDir, CONFIG_FILE);
end;

procedure ResetConfigToDefaults(var AConfig: TGameConfig);
begin
  AConfig.MusicEnabled := True;
  AConfig.SfxEnabled := True;
  AConfig.Fullscreen := False; // default to windowed
end;

procedure LoadConfig(var AConfig: TGameConfig);
var
  ini: TIniFile;
  path: string;
begin
  // initialize defaults first
  ResetConfigToDefaults(AConfig);
  path := GetConfigFilePath;
  if (path = '') or (not FileExists(path)) then
    Exit;

  ini := nil;
  try
    try
      ini := TIniFile.Create(path);
      AConfig.MusicEnabled := ini.ReadBool('Audio','MusicEnabled', AConfig.MusicEnabled);
      AConfig.SfxEnabled   := ini.ReadBool('Audio','SfxEnabled',   AConfig.SfxEnabled);
      // read display settings if present
      AConfig.Fullscreen   := ini.ReadBool('Display','Fullscreen', AConfig.Fullscreen);
    except
      on E: Exception do
      begin
        // Ignore any read/IO errors and keep defaults
      end;
    end;
  finally
    if Assigned(ini) then
      ini.Free;
  end;
end;

function LoadConfig: TGameConfig;
begin
  LoadConfig(Result);
end;

procedure SaveConfig(const AConfig: TGameConfig);
var
  ini: TIniFile;
  path, tmpPath, dir: string;
begin
  path := GetConfigFilePath;
  if path = '' then
    path := TPath.Combine('.', CONFIG_FILE);

  // ensure parent dir exists
  dir := ExtractFilePath(path);
  if dir = '' then
  begin
    try
      dir := TDirectory.GetCurrentDirectory;
    except
      dir := '.';
    end;
    path := TPath.Combine(dir, CONFIG_FILE);
  end;

  if not DirectoryExists(ExtractFilePath(path)) then
  begin
    try
      TDirectory.CreateDirectory(ExtractFilePath(path));
    except
      // ignore
    end;
  end;

  // write to a temporary file first then replace to ensure atomicity
  tmpPath := path + '.tmp';
  ini := nil;
  try
    try
      ini := TIniFile.Create(tmpPath);
      ini.WriteBool('Audio','MusicEnabled', AConfig.MusicEnabled);
      ini.WriteBool('Audio','SfxEnabled',   AConfig.SfxEnabled);
      ini.WriteBool('Display','Fullscreen', AConfig.Fullscreen);
    except
      on E: Exception do
      begin
        // If writing to tmp fails, attempt to write directly to final path as a best-effort
        try
          if Assigned(ini) then
            ini.Free;
          ini := TIniFile.Create(path);
          ini.WriteBool('Audio','MusicEnabled', AConfig.MusicEnabled);
          ini.WriteBool('Audio','SfxEnabled',   AConfig.SfxEnabled);
          ini.WriteBool('Display','Fullscreen', AConfig.Fullscreen);
        except
          // give up silently - avoid propagating low-level IO errors as AVs
        end;
      end;
    end;
  finally
    if Assigned(ini) then
      ini.Free;
  end;

  // replace original with tmp (best-effort)
  try
    if FileExists(path) then
      TFile.Delete(path);
    if FileExists(tmpPath) then
      TFile.Move(tmpPath, path)
    else
    begin
      // nothing to move - maybe we already wrote directly to path above
    end;
  except
    // If atomic replace fails, attempt a non-atomic fallback
    if FileExists(tmpPath) then
    begin
      try
        TFile.Copy(tmpPath, path, True);
        TFile.Delete(tmpPath);
      except
        // ignore - we can't do much here in cross-platform helper
      end;
    end;
  end;
end;

end.
