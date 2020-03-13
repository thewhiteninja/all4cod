#include "dll.h"
#include <windows.h>

DLLEXPORT void Init(void){
    //
}

DLLEXPORT DllInfos __stdcall GetInfo (void){
    DllInfos Info = {"thewhiteninja", "30 Juillet 2005", "Pas trop dur na ?", "Ce plugins (qui n'en est pas vraiment un) efface le fichier et place le fichier d'en-têtes pour faire une Dlll en C pour All4Cod.",
                     "DevC++ 4.9.9.0", "http://localhost", "mail@localhost",
                     "DllName", "MenuCaption", 1, 1, 1};    
    return Info;                 
}

DLLEXPORT char* __stdcall Execute (char* command, char* param){
    char* response = NULL; 
    //
    return response;   
}

DLLEXPORT void Close(void){
    //
}              

BOOL APIENTRY DllMain (HINSTANCE hInst, DWORD reason, LPVOID reserved){
    // 
    return TRUE;
}
