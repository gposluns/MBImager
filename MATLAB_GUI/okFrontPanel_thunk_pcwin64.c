/* C thunk file for functions in okFrontPanel_proto.m generated on Fri Jun 16 12:57:20 2017. */


#ifdef _WIN32
  #define DLL_EXPORT_SYM __declspec(dllexport)
#elif __GNUC__ >= 4
  #define DLL_EXPORT_SYM __attribute__ ((visibility("default")))
#else
  #define DLL_EXPORT_SYM
#endif

#ifdef LCC_WIN64
  #define DLL_EXPORT_SYM
#endif

#ifdef  __cplusplus
#define EXPORT_EXTERN_C extern "C" DLL_EXPORT_SYM
#else
#define EXPORT_EXTERN_C DLL_EXPORT_SYM
#endif

#include <tmwtypes.h>

/* use BUILDING_THUNKFILE to protect parts of your header if needed when building the thunkfile */
#define BUILDING_THUNKFILE

#include "okFrontPanelDLL.h"
#ifdef LCC_WIN64
#define EXPORT_EXTERN_C __declspec(dllexport)
#endif

/*  Bool _stdcall  okFrontPanelDLL_LoadLib ( okFP_dll_pchar libname ); */
EXPORT_EXTERN_C int32_T int32cstringThunk(void fcn(),const char *callstack,int stacksize)
{
	char * p0;
	p0=*(char * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	return ((int32_T (*)(char * ))fcn)(p0);
}

/*  void _stdcall  okFrontPanelDLL_FreeLib ( void ); */
EXPORT_EXTERN_C void voidvoidThunk(void fcn(),const char *callstack,int stacksize)
{
	((void (*)(void ))fcn)();
}

/*  void _stdcall  okFrontPanelDLL_GetVersion ( char * date , char * time ); */
EXPORT_EXTERN_C void voidcstringcstringThunk(void fcn(),const char *callstack,int stacksize)
{
	char * p0;
	char * p1;
	p0=*(char * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(char * const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	((void (*)(char * , char * ))fcn)(p0 , p1);
}

/*  okPLL22393_HANDLE _stdcall  okPLL22393_Construct (); */
EXPORT_EXTERN_C unsigned long ulongThunk(void fcn(),const char *callstack,int stacksize)
{
	return ((unsigned long (*)( ))fcn)();
}

/*  void _stdcall  okPLL22393_Destruct ( okPLL22393_HANDLE pll ); */
EXPORT_EXTERN_C void voidulongThunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	((void (*)(unsigned long ))fcn)(p0);
}

/*  void _stdcall  okPLL22393_SetCrystalLoad ( okPLL22393_HANDLE pll , double capload ); */
EXPORT_EXTERN_C void voidulongdoubleThunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	double p1;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(double const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	((void (*)(unsigned long , double ))fcn)(p0 , p1);
}

/*  double _stdcall  okPLL22393_GetReference ( okPLL22393_HANDLE pll ); */
EXPORT_EXTERN_C double doubleulongThunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	return ((double (*)(unsigned long ))fcn)(p0);
}

/*  Bool _stdcall  okPLL22393_SetPLLParameters ( okPLL22393_HANDLE pll , int n , int p , int q , Bool enable ); */
EXPORT_EXTERN_C int32_T int32ulongint32int32int32int32Thunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	int32_T p1;
	int32_T p2;
	int32_T p3;
	int32_T p4;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_T const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(int32_T const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	p3=*(int32_T const *)callstack;
	callstack+=sizeof(p3) % sizeof(size_t) ? ((sizeof(p3) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p3);
	p4=*(int32_T const *)callstack;
	callstack+=sizeof(p4) % sizeof(size_t) ? ((sizeof(p4) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p4);
	return ((int32_T (*)(unsigned long , int32_T , int32_T , int32_T , int32_T ))fcn)(p0 , p1 , p2 , p3 , p4);
}

/*  Bool _stdcall  okPLL22393_SetPLLLF ( okPLL22393_HANDLE pll , int n , int lf ); */
EXPORT_EXTERN_C int32_T int32ulongint32int32Thunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	int32_T p1;
	int32_T p2;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_T const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(int32_T const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	return ((int32_T (*)(unsigned long , int32_T , int32_T ))fcn)(p0 , p1 , p2);
}

/*  Bool _stdcall  okPLL22393_SetOutputSource ( okPLL22393_HANDLE pll , int n , ok_ClockSource_22393 clksrc ); */
EXPORT_EXTERN_C int32_T int32ulongint32ok_ClockSource_22393Thunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	int32_T p1;
	ok_ClockSource_22393 p2;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_T const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(ok_ClockSource_22393 const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	return ((int32_T (*)(unsigned long , int32_T , ok_ClockSource_22393 ))fcn)(p0 , p1 , p2);
}

/*  void _stdcall  okPLL22393_SetOutputEnable ( okPLL22393_HANDLE pll , int n , Bool enable ); */
EXPORT_EXTERN_C void voidulongint32int32Thunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	int32_T p1;
	int32_T p2;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_T const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(int32_T const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	((void (*)(unsigned long , int32_T , int32_T ))fcn)(p0 , p1 , p2);
}

/*  int _stdcall  okPLL22393_GetPLLP ( okPLL22393_HANDLE pll , int n ); */
EXPORT_EXTERN_C int32_T int32ulongint32Thunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	int32_T p1;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_T const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	return ((int32_T (*)(unsigned long , int32_T ))fcn)(p0 , p1);
}

/*  double _stdcall  okPLL22393_GetPLLFrequency ( okPLL22393_HANDLE pll , int n ); */
EXPORT_EXTERN_C double doubleulongint32Thunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	int32_T p1;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_T const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	return ((double (*)(unsigned long , int32_T ))fcn)(p0 , p1);
}

/*  ok_ClockSource_22393 _stdcall  okPLL22393_GetOutputSource ( okPLL22393_HANDLE pll , int n ); */
EXPORT_EXTERN_C ok_ClockSource_22393 ok_ClockSource_22393ulongint32Thunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	int32_T p1;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_T const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	return ((ok_ClockSource_22393 (*)(unsigned long , int32_T ))fcn)(p0 , p1);
}

/*  void _stdcall  okPLL22393_InitFromProgrammingInfo ( okPLL22393_HANDLE pll , unsigned char * buf ); */
EXPORT_EXTERN_C void voidulongvoidPtrThunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	void * p1;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(void * const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	((void (*)(unsigned long , void * ))fcn)(p0 , p1);
}

/*  void _stdcall  okPLL22150_SetReference ( okPLL22150_HANDLE pll , double freq , Bool extosc ); */
EXPORT_EXTERN_C void voidulongdoubleint32Thunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	double p1;
	int32_T p2;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(double const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(int32_T const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	((void (*)(unsigned long , double , int32_T ))fcn)(p0 , p1 , p2);
}

/*  int _stdcall  okPLL22150_GetVCOP ( okPLL22150_HANDLE pll ); */
EXPORT_EXTERN_C int32_T int32ulongThunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	return ((int32_T (*)(unsigned long ))fcn)(p0);
}

/*  void _stdcall  okPLL22150_SetDiv1 ( okPLL22150_HANDLE pll , ok_DividerSource divsrc , int n ); */
EXPORT_EXTERN_C void voidulongok_DividerSourceint32Thunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	ok_DividerSource p1;
	int32_T p2;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(ok_DividerSource const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(int32_T const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	((void (*)(unsigned long , ok_DividerSource , int32_T ))fcn)(p0 , p1 , p2);
}

/*  ok_DividerSource _stdcall  okPLL22150_GetDiv1Source ( okPLL22150_HANDLE pll ); */
EXPORT_EXTERN_C ok_DividerSource ok_DividerSourceulongThunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	return ((ok_DividerSource (*)(unsigned long ))fcn)(p0);
}

/*  void _stdcall  okPLL22150_SetOutputSource ( okPLL22150_HANDLE pll , int output , ok_ClockSource_22150 clksrc ); */
EXPORT_EXTERN_C void voidulongint32ok_ClockSource_22150Thunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	int32_T p1;
	ok_ClockSource_22150 p2;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_T const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(ok_ClockSource_22150 const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	((void (*)(unsigned long , int32_T , ok_ClockSource_22150 ))fcn)(p0 , p1 , p2);
}

/*  ok_ClockSource_22150 _stdcall  okPLL22150_GetOutputSource ( okPLL22150_HANDLE pll , int output ); */
EXPORT_EXTERN_C ok_ClockSource_22150 ok_ClockSource_22150ulongint32Thunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	int32_T p1;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_T const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	return ((ok_ClockSource_22150 (*)(unsigned long , int32_T ))fcn)(p0 , p1);
}

/*  okDeviceSettings_HANDLE _stdcall  okDeviceSettings_Construct (); */
EXPORT_EXTERN_C void * voidPtrThunk(void fcn(),const char *callstack,int stacksize)
{
	return ((void * (*)( ))fcn)();
}

/*  void _stdcall  okDeviceSettings_Destruct ( okDeviceSettings_HANDLE hnd ); */
EXPORT_EXTERN_C void voidvoidPtrThunk(void fcn(),const char *callstack,int stacksize)
{
	void * p0;
	p0=*(void * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	((void (*)(void * ))fcn)(p0);
}

/*  ok_ErrorCode _stdcall  okDeviceSettings_GetString ( okDeviceSettings_HANDLE hnd , const char * key , int length , char * buf ); */
EXPORT_EXTERN_C ok_ErrorCode ok_ErrorCodevoidPtrcstringint32cstringThunk(void fcn(),const char *callstack,int stacksize)
{
	void * p0;
	char * p1;
	int32_T p2;
	char * p3;
	p0=*(void * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(char * const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(int32_T const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	p3=*(char * const *)callstack;
	callstack+=sizeof(p3) % sizeof(size_t) ? ((sizeof(p3) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p3);
	return ((ok_ErrorCode (*)(void * , char * , int32_T , char * ))fcn)(p0 , p1 , p2 , p3);
}

/*  ok_ErrorCode _stdcall  okDeviceSettings_SetString ( okDeviceSettings_HANDLE hnd , const char * key , const char * buf ); */
EXPORT_EXTERN_C ok_ErrorCode ok_ErrorCodevoidPtrcstringcstringThunk(void fcn(),const char *callstack,int stacksize)
{
	void * p0;
	char * p1;
	char * p2;
	p0=*(void * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(char * const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(char * const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	return ((ok_ErrorCode (*)(void * , char * , char * ))fcn)(p0 , p1 , p2);
}

/*  ok_ErrorCode _stdcall  okDeviceSettings_GetInt ( okDeviceSettings_HANDLE hnd , const char * key , UINT32 * value ); */
EXPORT_EXTERN_C ok_ErrorCode ok_ErrorCodevoidPtrcstringvoidPtrThunk(void fcn(),const char *callstack,int stacksize)
{
	void * p0;
	char * p1;
	void * p2;
	p0=*(void * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(char * const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(void * const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	return ((ok_ErrorCode (*)(void * , char * , void * ))fcn)(p0 , p1 , p2);
}

/*  ok_ErrorCode _stdcall  okDeviceSettings_SetInt ( okDeviceSettings_HANDLE hnd , const char * key , UINT32 value ); */
EXPORT_EXTERN_C ok_ErrorCode ok_ErrorCodevoidPtrcstringuint32Thunk(void fcn(),const char *callstack,int stacksize)
{
	void * p0;
	char * p1;
	uint32_T p2;
	p0=*(void * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(char * const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(uint32_T const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	return ((ok_ErrorCode (*)(void * , char * , uint32_T ))fcn)(p0 , p1 , p2);
}

/*  ok_ErrorCode _stdcall  okDeviceSettings_Delete ( okDeviceSettings_HANDLE hnd , const char * key ); */
EXPORT_EXTERN_C ok_ErrorCode ok_ErrorCodevoidPtrcstringThunk(void fcn(),const char *callstack,int stacksize)
{
	void * p0;
	char * p1;
	p0=*(void * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(char * const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	return ((ok_ErrorCode (*)(void * , char * ))fcn)(p0 , p1);
}

/*  ok_ErrorCode _stdcall  okDeviceSettings_Save ( okDeviceSettings_HANDLE hnd ); */
EXPORT_EXTERN_C ok_ErrorCode ok_ErrorCodevoidPtrThunk(void fcn(),const char *callstack,int stacksize)
{
	void * p0;
	p0=*(void * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	return ((ok_ErrorCode (*)(void * ))fcn)(p0);
}

/*  okFirmwarePackage_HANDLE _stdcall  okFirmwarePackage_Load ( const char * filename ); */
EXPORT_EXTERN_C void * voidPtrcstringThunk(void fcn(),const char *callstack,int stacksize)
{
	char * p0;
	p0=*(char * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	return ((void * (*)(char * ))fcn)(p0);
}

/*  int _stdcall  okFirmwarePackage_GetFirmwareCount ( okFirmwarePackage_HANDLE hnd ); */
EXPORT_EXTERN_C int32_T int32voidPtrThunk(void fcn(),const char *callstack,int stacksize)
{
	void * p0;
	p0=*(void * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	return ((int32_T (*)(void * ))fcn)(p0);
}

/*  okFirmware_HANDLE _stdcall  okFirmwarePackage_GetFirmware ( okFirmwarePackage_HANDLE hnd , int num ); */
EXPORT_EXTERN_C void * voidPtrvoidPtrint32Thunk(void fcn(),const char *callstack,int stacksize)
{
	void * p0;
	int32_T p1;
	p0=*(void * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_T const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	return ((void * (*)(void * , int32_T ))fcn)(p0 , p1);
}

/*  ok_ErrorCode _stdcall  okFirmware_PerformTasks ( okFirmware_HANDLE hnd , const char * serial , okFirmware_PerformTasks_Callback callback , void * arg ); */
EXPORT_EXTERN_C ok_ErrorCode ok_ErrorCodevoidPtrcstringvoidPtrvoidPtrThunk(void fcn(),const char *callstack,int stacksize)
{
	void * p0;
	char * p1;
	void * p2;
	void * p3;
	p0=*(void * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(char * const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(void * const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	p3=*(void * const *)callstack;
	callstack+=sizeof(p3) % sizeof(size_t) ? ((sizeof(p3) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p3);
	return ((ok_ErrorCode (*)(void * , char * , void * , void * ))fcn)(p0 , p1 , p2 , p3);
}

/*  ok_ErrorCode _stdcall  okFrontPanel_WriteI2C ( okFrontPanel_HANDLE hnd , const int addr , int length , unsigned char * data ); */
EXPORT_EXTERN_C ok_ErrorCode ok_ErrorCodeulongint32int32voidPtrThunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	int32_T p1;
	int32_T p2;
	void * p3;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_T const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(int32_T const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	p3=*(void * const *)callstack;
	callstack+=sizeof(p3) % sizeof(size_t) ? ((sizeof(p3) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p3);
	return ((ok_ErrorCode (*)(unsigned long , int32_T , int32_T , void * ))fcn)(p0 , p1 , p2 , p3);
}

/*  ok_ErrorCode _stdcall  okFrontPanel_FlashEraseSector ( okFrontPanel_HANDLE hnd , UINT32 address ); */
EXPORT_EXTERN_C ok_ErrorCode ok_ErrorCodeulonguint32Thunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	uint32_T p1;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(uint32_T const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	return ((ok_ErrorCode (*)(unsigned long , uint32_T ))fcn)(p0 , p1);
}

/*  ok_ErrorCode _stdcall  okFrontPanel_FlashWrite ( okFrontPanel_HANDLE hnd , UINT32 address , UINT32 length , const UINT8 * buf ); */
EXPORT_EXTERN_C ok_ErrorCode ok_ErrorCodeulonguint32uint32voidPtrThunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	uint32_T p1;
	uint32_T p2;
	void * p3;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(uint32_T const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(uint32_T const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	p3=*(void * const *)callstack;
	callstack+=sizeof(p3) % sizeof(size_t) ? ((sizeof(p3) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p3);
	return ((ok_ErrorCode (*)(unsigned long , uint32_T , uint32_T , void * ))fcn)(p0 , p1 , p2 , p3);
}

/*  ok_ErrorCode _stdcall  okFrontPanel_ReadRegister ( okFrontPanel_HANDLE hnd , UINT32 addr , UINT32 * data ); */
EXPORT_EXTERN_C ok_ErrorCode ok_ErrorCodeulonguint32voidPtrThunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	uint32_T p1;
	void * p2;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(uint32_T const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(void * const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	return ((ok_ErrorCode (*)(unsigned long , uint32_T , void * ))fcn)(p0 , p1 , p2);
}

/*  ok_ErrorCode _stdcall  okFrontPanel_WriteRegister ( okFrontPanel_HANDLE hnd , UINT32 addr , UINT32 data ); */
EXPORT_EXTERN_C ok_ErrorCode ok_ErrorCodeulonguint32uint32Thunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	uint32_T p1;
	uint32_T p2;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(uint32_T const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(uint32_T const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	return ((ok_ErrorCode (*)(unsigned long , uint32_T , uint32_T ))fcn)(p0 , p1 , p2);
}

/*  ok_BoardModel _stdcall  okFrontPanel_GetBoardModel ( okFrontPanel_HANDLE hnd ); */
EXPORT_EXTERN_C ok_BoardModel ok_BoardModelulongThunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	return ((ok_BoardModel (*)(unsigned long ))fcn)(p0);
}

/*  void _stdcall  okFrontPanel_GetBoardModelString ( okFrontPanel_HANDLE hnd , ok_BoardModel m , char * buf ); */
EXPORT_EXTERN_C void voidulongok_BoardModelcstringThunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	ok_BoardModel p1;
	char * p2;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(ok_BoardModel const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(char * const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	((void (*)(unsigned long , ok_BoardModel , char * ))fcn)(p0 , p1 , p2);
}

/*  ok_BoardModel _stdcall  okFrontPanel_GetDeviceListModel ( okFrontPanel_HANDLE hnd , int num ); */
EXPORT_EXTERN_C ok_BoardModel ok_BoardModelulongint32Thunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	int32_T p1;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_T const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	return ((ok_BoardModel (*)(unsigned long , int32_T ))fcn)(p0 , p1);
}

/*  void _stdcall  okFrontPanel_GetDeviceListSerial ( okFrontPanel_HANDLE hnd , int num , char * buf ); */
EXPORT_EXTERN_C void voidulongint32cstringThunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	int32_T p1;
	char * p2;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_T const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(char * const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	((void (*)(unsigned long , int32_T , char * ))fcn)(p0 , p1 , p2);
}

/*  ok_ErrorCode _stdcall  okFrontPanel_OpenBySerial ( okFrontPanel_HANDLE hnd , const char * serial ); */
EXPORT_EXTERN_C ok_ErrorCode ok_ErrorCodeulongcstringThunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	char * p1;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(char * const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	return ((ok_ErrorCode (*)(unsigned long , char * ))fcn)(p0 , p1);
}

/*  void _stdcall  okFrontPanel_EnableAsynchronousTransfers ( okFrontPanel_HANDLE hnd , Bool enable ); */
EXPORT_EXTERN_C void voidulongint32Thunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	int32_T p1;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_T const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	((void (*)(unsigned long , int32_T ))fcn)(p0 , p1);
}

/*  ok_ErrorCode _stdcall  okFrontPanel_SetBTPipePollingInterval ( okFrontPanel_HANDLE hnd , int interval ); */
EXPORT_EXTERN_C ok_ErrorCode ok_ErrorCodeulongint32Thunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	int32_T p1;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_T const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	return ((ok_ErrorCode (*)(unsigned long , int32_T ))fcn)(p0 , p1);
}

/*  ok_ErrorCode _stdcall  okFrontPanel_ResetFPGA ( okFrontPanel_HANDLE hnd ); */
EXPORT_EXTERN_C ok_ErrorCode ok_ErrorCodeulongThunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	return ((ok_ErrorCode (*)(unsigned long ))fcn)(p0);
}

/*  void _stdcall  okFrontPanel_GetSerialNumber ( okFrontPanel_HANDLE hnd , char * buf ); */
EXPORT_EXTERN_C void voidulongcstringThunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	char * p1;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(char * const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	((void (*)(unsigned long , char * ))fcn)(p0 , p1);
}

/*  ok_ErrorCode _stdcall  okFrontPanel_GetDeviceSettings ( okFrontPanel_HANDLE hnd , okDeviceSettings_HANDLE settings ); */
EXPORT_EXTERN_C ok_ErrorCode ok_ErrorCodeulongvoidPtrThunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	void * p1;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(void * const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	return ((ok_ErrorCode (*)(unsigned long , void * ))fcn)(p0 , p1);
}

/*  ok_ErrorCode _stdcall  okFrontPanel_GetDeviceInfoWithSize ( okFrontPanel_HANDLE hnd , okTDeviceInfo * info , unsigned size ); */
EXPORT_EXTERN_C ok_ErrorCode ok_ErrorCodeulongvoidPtruint32Thunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	void * p1;
	uint32_T p2;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(void * const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(uint32_T const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	return ((ok_ErrorCode (*)(unsigned long , void * , uint32_T ))fcn)(p0 , p1 , p2);
}

/*  ok_ErrorCode _stdcall  okFrontPanel_ConfigureFPGAFromMemory ( okFrontPanel_HANDLE hnd , unsigned char * data , unsigned long length ); */
EXPORT_EXTERN_C ok_ErrorCode ok_ErrorCodeulongvoidPtrulongThunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	void * p1;
	unsigned long p2;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(void * const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(unsigned long const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	return ((ok_ErrorCode (*)(unsigned long , void * , unsigned long ))fcn)(p0 , p1 , p2);
}

/*  ok_ErrorCode _stdcall  okFrontPanel_GetPLL22150Configuration ( okFrontPanel_HANDLE hnd , okPLL22150_HANDLE pll ); */
EXPORT_EXTERN_C ok_ErrorCode ok_ErrorCodeulongulongThunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	unsigned long p1;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(unsigned long const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	return ((ok_ErrorCode (*)(unsigned long , unsigned long ))fcn)(p0 , p1);
}

/*  ok_ErrorCode _stdcall  okFrontPanel_GetWireInValue ( okFrontPanel_HANDLE hnd , int epAddr , UINT32 * val ); */
EXPORT_EXTERN_C ok_ErrorCode ok_ErrorCodeulongint32voidPtrThunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	int32_T p1;
	void * p2;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_T const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(void * const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	return ((ok_ErrorCode (*)(unsigned long , int32_T , void * ))fcn)(p0 , p1 , p2);
}

/*  ok_ErrorCode _stdcall  okFrontPanel_SetWireInValue ( okFrontPanel_HANDLE hnd , int ep , unsigned long val , unsigned long mask ); */
EXPORT_EXTERN_C ok_ErrorCode ok_ErrorCodeulongint32ulongulongThunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	int32_T p1;
	unsigned long p2;
	unsigned long p3;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_T const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(unsigned long const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	p3=*(unsigned long const *)callstack;
	callstack+=sizeof(p3) % sizeof(size_t) ? ((sizeof(p3) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p3);
	return ((ok_ErrorCode (*)(unsigned long , int32_T , unsigned long , unsigned long ))fcn)(p0 , p1 , p2 , p3);
}

/*  unsigned long _stdcall  okFrontPanel_GetWireOutValue ( okFrontPanel_HANDLE hnd , int epAddr ); */
EXPORT_EXTERN_C unsigned long ulongulongint32Thunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	int32_T p1;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_T const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	return ((unsigned long (*)(unsigned long , int32_T ))fcn)(p0 , p1);
}

/*  ok_ErrorCode _stdcall  okFrontPanel_ActivateTriggerIn ( okFrontPanel_HANDLE hnd , int epAddr , int bit ); */
EXPORT_EXTERN_C ok_ErrorCode ok_ErrorCodeulongint32int32Thunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	int32_T p1;
	int32_T p2;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_T const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(int32_T const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	return ((ok_ErrorCode (*)(unsigned long , int32_T , int32_T ))fcn)(p0 , p1 , p2);
}

/*  Bool _stdcall  okFrontPanel_IsTriggered ( okFrontPanel_HANDLE hnd , int epAddr , unsigned long mask ); */
EXPORT_EXTERN_C int32_T int32ulongint32ulongThunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	int32_T p1;
	unsigned long p2;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_T const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(unsigned long const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	return ((int32_T (*)(unsigned long , int32_T , unsigned long ))fcn)(p0 , p1 , p2);
}

/*  long _stdcall  okFrontPanel_GetLastTransferLength ( okFrontPanel_HANDLE hnd ); */
EXPORT_EXTERN_C long longulongThunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	return ((long (*)(unsigned long ))fcn)(p0);
}

/*  long _stdcall  okFrontPanel_WriteToPipeIn ( okFrontPanel_HANDLE hnd , int epAddr , long length , unsigned char * data ); */
EXPORT_EXTERN_C long longulongint32longvoidPtrThunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	int32_T p1;
	long p2;
	void * p3;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_T const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(long const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	p3=*(void * const *)callstack;
	callstack+=sizeof(p3) % sizeof(size_t) ? ((sizeof(p3) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p3);
	return ((long (*)(unsigned long , int32_T , long , void * ))fcn)(p0 , p1 , p2 , p3);
}

/*  long _stdcall  okFrontPanel_WriteToBlockPipeIn ( okFrontPanel_HANDLE hnd , int epAddr , int blockSize , long length , unsigned char * data ); */
EXPORT_EXTERN_C long longulongint32int32longvoidPtrThunk(void fcn(),const char *callstack,int stacksize)
{
	unsigned long p0;
	int32_T p1;
	int32_T p2;
	long p3;
	void * p4;
	p0=*(unsigned long const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(int32_T const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	p2=*(int32_T const *)callstack;
	callstack+=sizeof(p2) % sizeof(size_t) ? ((sizeof(p2) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p2);
	p3=*(long const *)callstack;
	callstack+=sizeof(p3) % sizeof(size_t) ? ((sizeof(p3) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p3);
	p4=*(void * const *)callstack;
	callstack+=sizeof(p4) % sizeof(size_t) ? ((sizeof(p4) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p4);
	return ((long (*)(unsigned long , int32_T , int32_T , long , void * ))fcn)(p0 , p1 , p2 , p3 , p4);
}

/*  okCFrontPanelManager_HANDLE _stdcall  okFrontPanelManager_Construct ( okFrontPanelManager_HANDLE self ); */
EXPORT_EXTERN_C void * voidPtrvoidPtrThunk(void fcn(),const char *callstack,int stacksize)
{
	void * p0;
	p0=*(void * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	return ((void * (*)(void * ))fcn)(p0);
}

/*  okFrontPanel_HANDLE _stdcall  okFrontPanelManager_Open ( okCFrontPanelManager_HANDLE hnd , const char * serial ); */
EXPORT_EXTERN_C unsigned long ulongvoidPtrcstringThunk(void fcn(),const char *callstack,int stacksize)
{
	void * p0;
	char * p1;
	p0=*(void * const *)callstack;
	callstack+=sizeof(p0) % sizeof(size_t) ? ((sizeof(p0) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p0);
	p1=*(char * const *)callstack;
	callstack+=sizeof(p1) % sizeof(size_t) ? ((sizeof(p1) / sizeof(size_t)) + 1) * sizeof(size_t):sizeof(p1);
	return ((unsigned long (*)(void * , char * ))fcn)(p0 , p1);
}

