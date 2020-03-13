#ifndef _DLL_H_
#define _DLL_H_

#define DLLEXPORT __declspec (dllexport)

typedef struct 
{
    char *Author, *Date, *Comment, *Description, *MakeWith, *WebSite, *Mail,
         *DllName, *MenuCaption;
    unsigned char Menu, NeedFileOpen, NeedFileSaved;     
} DllInfos;
       
DLLEXPORT void Init(void);
DLLEXPORT DllInfos __stdcall GetInfo (void);
DLLEXPORT char* __stdcall Execute (char* command, char* param);
DLLEXPORT void Close(void)

#endif
