unit UniPas.Routing.Pages;

interface

uses
  System.Classes,
  UniPas.uFrame_404PageNotFound,

  // Pages (moved from application Pages folder into routing registration)
  uFrame_Home,
  uFrame_About,
  uFrame_Instructions,
  uFrame_MainMenu,
  uFrame_Options,
  uFrame_MapSelection,
  uFrame_Map1,
  uFrame_Map2,
  uFrame_Map3,
  uFrame_Map4,
  uFrame_Map5,
  uFrame_Map6;

const
  PagesArray: TArray<String> = ['404PageNotFound',
                                'Home',
                                'About',
                                'Instructions',
                                'MainMenu',
                                'Options',
                                'MapSelection',
                                'Map1',
                                'Map2',
                                'Map3',
                                'Map4',
                                'Map5',
                                'Map6'
                               ];

implementation

initialization
  // Register all page frame classes in one place so TUniPas can Create them by name.
  RegisterClasses([TFrame_404PageNotFound, TFrame_Home, TFrame_About, TFrame_Instructions,
                   TFrame_MainMenu, TFrame_Options, TFrame_MapSelection,
                   TFrame_Map1, TFrame_Map2, TFrame_Map3, TFrame_Map4, TFrame_Map5, TFrame_Map6]);

end.
