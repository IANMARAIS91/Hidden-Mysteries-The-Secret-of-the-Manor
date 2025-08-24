unit Ian.Utilities;

interface

procedure LoadBackgroundFromURL(const AURL: string);

implementation

procedure LoadBackgroundFromURL(const AURL: string);
//var
//  Client: THTTPClient;
//  Mem: TMemoryStream;
begin
//  Client := THTTPClient.Create;
//  Mem := TMemoryStream.Create;
//  try
//    try
//      Client.Get(AURL, Mem);
//      Mem.Position := 0;
//      if FBackground.Bitmap = nil then
//        FBackground.Bitmap := TBitmap.Create;
//      FBackground.Bitmap.LoadFromStream(Mem);
//    except
//      // ignore failures - leave background blank
//    end;
//  finally
//    Mem.Free;
//    Client.Free;
//  end;
end;

end.
