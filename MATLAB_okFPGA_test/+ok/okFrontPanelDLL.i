#line 1 "C:\\Users\\Roman Genov\\Documents\\csm_pkg_rel1.1_activepxl\\okFrontPanelDLL.h"




















	


		

		
			#pragma comment(lib, "okFrontPanel")
		#line 29 "C:\\Users\\Roman Genov\\Documents\\csm_pkg_rel1.1_activepxl\\okFrontPanelDLL.h"
	#line 30 "C:\\Users\\Roman Genov\\Documents\\csm_pkg_rel1.1_activepxl\\okFrontPanelDLL.h"
	
	typedef unsigned int  UINT32;
	typedef unsigned char UINT8;





#line 39 "C:\\Users\\Roman Genov\\Documents\\csm_pkg_rel1.1_activepxl\\okFrontPanelDLL.h"




#line 44 "C:\\Users\\Roman Genov\\Documents\\csm_pkg_rel1.1_activepxl\\okFrontPanelDLL.h"
	typedef const char * okFP_dll_pchar;


#line 48 "C:\\Users\\Roman Genov\\Documents\\csm_pkg_rel1.1_activepxl\\okFrontPanelDLL.h"












typedef unsigned long okPLL22150_HANDLE;
typedef unsigned long okPLL22393_HANDLE;
typedef unsigned long okFrontPanel_HANDLE;
typedef struct okDeviceSettingsHandle* okDeviceSettings_HANDLE;
typedef struct okFirmwareHandle* okFirmware_HANDLE;
typedef struct okFirmwarePackageHandle* okFirmwarePackage_HANDLE;
typedef struct okFrontPanelManagerHandle* okFrontPanelManager_HANDLE;
typedef struct okCFrontPanelManagerHandle* okCFrontPanelManager_HANDLE;
typedef int Bool;



	typedef char okBool;
#line 74 "C:\\Users\\Roman Genov\\Documents\\csm_pkg_rel1.1_activepxl\\okFrontPanelDLL.h"






	
	
#line 83 "C:\\Users\\Roman Genov\\Documents\\csm_pkg_rel1.1_activepxl\\okFrontPanelDLL.h"

typedef enum {
	ok_ClkSrc22150_Ref=0,
	ok_ClkSrc22150_Div1ByN=1,
	ok_ClkSrc22150_Div1By2=2,
	ok_ClkSrc22150_Div1By3=3,
	ok_ClkSrc22150_Div2ByN=4,
	ok_ClkSrc22150_Div2By2=5,
	ok_ClkSrc22150_Div2By4=6
} ok_ClockSource_22150;

typedef enum {
	ok_ClkSrc22393_Ref=0,
	ok_ClkSrc22393_PLL0_0=2,
	ok_ClkSrc22393_PLL0_180=3,
	ok_ClkSrc22393_PLL1_0=4,
	ok_ClkSrc22393_PLL1_180=5,
	ok_ClkSrc22393_PLL2_0=6,
	ok_ClkSrc22393_PLL2_180=7
} ok_ClockSource_22393;

typedef enum {
	ok_DivSrc_Ref = 0, 
	ok_DivSrc_VCO = 1
} ok_DividerSource;

typedef enum {
	ok_brdUnknown = 0,
	ok_brdXEM3001v1 = 1,
	ok_brdXEM3001v2 = 2,
	ok_brdXEM3010 = 3,
	ok_brdXEM3005 = 4,
	ok_brdXEM3001CL = 5,
	ok_brdXEM3020 = 6,
	ok_brdXEM3050 = 7,
	ok_brdXEM9002 = 8,
	ok_brdXEM3001RB = 9,
	ok_brdXEM5010 = 10,
	ok_brdXEM6110LX45 = 11,
	ok_brdXEM6110LX150 = 15,
	ok_brdXEM6001 = 12,
	ok_brdXEM6010LX45 = 13,
	ok_brdXEM6010LX150 = 14,
	ok_brdXEM6006LX9 = 16,
	ok_brdXEM6006LX16 = 17,
	ok_brdXEM6006LX25 = 18,
	ok_brdXEM5010LX110 = 19,
	ok_brdZEM4310=20,
	ok_brdXEM6310LX45=21,
	ok_brdXEM6310LX150=22,
	ok_brdXEM6110v2LX45=23,
	ok_brdXEM6110v2LX150=24,
	ok_brdXEM6002LX9=25,
	ok_brdXEM6310MTLX45T=26,
	ok_brdXEM6320LX130T=27,
	ok_brdXEM7350K70T=28,
	ok_brdXEM7350K160T=29,
	ok_brdXEM7350K410T=30
} ok_BoardModel;

typedef enum {
	ok_NoError                    = 0,
	ok_Failed                     = -1,
	ok_Timeout                    = -2,
	ok_DoneNotHigh                = -3,
	ok_TransferError              = -4,
	ok_CommunicationError         = -5,
	ok_InvalidBitstream           = -6,
	ok_FileError                  = -7,
	ok_DeviceNotOpen              = -8,
	ok_InvalidEndpoint            = -9,
	ok_InvalidBlockSize           = -10,
	ok_I2CRestrictedAddress       = -11,
	ok_I2CBitError                = -12,
	ok_I2CNack                    = -13,
	ok_I2CUnknownStatus           = -14,
	ok_UnsupportedFeature         = -15,
	ok_FIFOUnderflow              = -16,
	ok_FIFOOverflow               = -17,
	ok_DataAlignmentError         = -18,
	ok_InvalidResetProfile        = -19,
	ok_InvalidParameter           = -20
} ok_ErrorCode;























































enum okEFPGAConfigurationMethod {
	ok_FPGAConfigurationMethod_NVRAM = (0),
	ok_FPGAConfigurationMethod_JTAG  = (1)
};


typedef struct {
	UINT32   address;
	UINT32   data;
} okTRegisterEntry;





typedef struct {
	UINT32   address;
	UINT32   mask;
} okTTriggerEntry;


typedef struct {
	
	UINT32                     magic;

	
	UINT32                     configFileLocation;

	
	UINT32                     configFileLength;

	
	
	UINT32                     doneWaitUS;

	
	
	UINT32                     resetWaitUS;

	
	
	UINT32                     registerWaitUS;

	
	UINT32                     padBytes1[28];

	
	
	UINT32                     wireInValues[32];

	
	UINT32                     registerEntryCount;

	
	okTRegisterEntry           registerEntries[256];

	
	UINT32                     triggerEntryCount;

	
	
	okTTriggerEntry            triggerEntries[32];

	
	UINT8                      padBytes2[1520];
} okTFPGAResetProfile;



typedef struct {
	UINT32             sectorCount;
	UINT32             sectorSize;
	UINT32             pageSize;
	UINT32             minUserSector;
	UINT32             maxUserSector;
} okTFlashLayout;


typedef struct {
	char            deviceID[(33)];
	char            serialNumber[(11)];
	char            productName[(128)];
	int             productID;
	int             deviceInterface;
	int             usbSpeed;
	int             deviceMajorVersion;
	int             deviceMinorVersion;
	int             hostInterfaceMajorVersion;
	int             hostInterfaceMinorVersion;
	okBool          isPLL22150Supported;
	okBool          isPLL22393Supported;
	okBool          isFrontPanelEnabled;
	int             wireWidth;
	int             triggerWidth;
	int             pipeWidth;
	int             registerAddressWidth;
	int             registerDataWidth;

	okTFlashLayout  flashSystem;
	okTFlashLayout  flashFPGA;

	okBool          hasFMCEEPROM;
} okTDeviceInfo;

#line 326 "C:\\Users\\Roman Genov\\Documents\\csm_pkg_rel1.1_activepxl\\okFrontPanelDLL.h"




__declspec(dllimport) Bool __stdcall okFrontPanelDLL_LoadLib(okFP_dll_pchar libname);
__declspec(dllimport) void __stdcall okFrontPanelDLL_FreeLib(void);
__declspec(dllimport) void __stdcall okFrontPanelDLL_GetVersion(char *date, char *time);




__declspec(dllimport) okPLL22393_HANDLE __stdcall okPLL22393_Construct();
__declspec(dllimport) void __stdcall okPLL22393_Destruct(okPLL22393_HANDLE pll);
__declspec(dllimport) void __stdcall okPLL22393_SetCrystalLoad(okPLL22393_HANDLE pll, double capload);
__declspec(dllimport) void __stdcall okPLL22393_SetReference(okPLL22393_HANDLE pll, double freq);
__declspec(dllimport) double __stdcall okPLL22393_GetReference(okPLL22393_HANDLE pll);
__declspec(dllimport) Bool __stdcall okPLL22393_SetPLLParameters(okPLL22393_HANDLE pll, int n, int p, int q, Bool enable);
__declspec(dllimport) Bool __stdcall okPLL22393_SetPLLLF(okPLL22393_HANDLE pll, int n, int lf);
__declspec(dllimport) Bool __stdcall okPLL22393_SetOutputDivider(okPLL22393_HANDLE pll, int n, int div);
__declspec(dllimport) Bool __stdcall okPLL22393_SetOutputSource(okPLL22393_HANDLE pll, int n, ok_ClockSource_22393 clksrc);
__declspec(dllimport) void __stdcall okPLL22393_SetOutputEnable(okPLL22393_HANDLE pll, int n, Bool enable);
__declspec(dllimport) int __stdcall okPLL22393_GetPLLP(okPLL22393_HANDLE pll, int n);
__declspec(dllimport) int __stdcall okPLL22393_GetPLLQ(okPLL22393_HANDLE pll, int n);
__declspec(dllimport) double __stdcall okPLL22393_GetPLLFrequency(okPLL22393_HANDLE pll, int n);
__declspec(dllimport) int __stdcall okPLL22393_GetOutputDivider(okPLL22393_HANDLE pll, int n);
__declspec(dllimport) ok_ClockSource_22393 __stdcall okPLL22393_GetOutputSource(okPLL22393_HANDLE pll, int n);
__declspec(dllimport) double __stdcall okPLL22393_GetOutputFrequency(okPLL22393_HANDLE pll, int n);
__declspec(dllimport) Bool __stdcall okPLL22393_IsOutputEnabled(okPLL22393_HANDLE pll, int n);
__declspec(dllimport) Bool __stdcall okPLL22393_IsPLLEnabled(okPLL22393_HANDLE pll, int n);
__declspec(dllimport) void __stdcall okPLL22393_InitFromProgrammingInfo(okPLL22393_HANDLE pll, unsigned char *buf);
__declspec(dllimport) void __stdcall okPLL22393_GetProgrammingInfo(okPLL22393_HANDLE pll, unsigned char *buf);





__declspec(dllimport) okPLL22150_HANDLE __stdcall okPLL22150_Construct();
__declspec(dllimport) void __stdcall okPLL22150_Destruct(okPLL22150_HANDLE pll);
__declspec(dllimport) void __stdcall okPLL22150_SetCrystalLoad(okPLL22150_HANDLE pll, double capload);
__declspec(dllimport) void __stdcall okPLL22150_SetReference(okPLL22150_HANDLE pll, double freq, Bool extosc);
__declspec(dllimport) double __stdcall okPLL22150_GetReference(okPLL22150_HANDLE pll);
__declspec(dllimport) Bool __stdcall okPLL22150_SetVCOParameters(okPLL22150_HANDLE pll, int p, int q);
__declspec(dllimport) int __stdcall okPLL22150_GetVCOP(okPLL22150_HANDLE pll);
__declspec(dllimport) int __stdcall okPLL22150_GetVCOQ(okPLL22150_HANDLE pll);
__declspec(dllimport) double __stdcall okPLL22150_GetVCOFrequency(okPLL22150_HANDLE pll);
__declspec(dllimport) void __stdcall okPLL22150_SetDiv1(okPLL22150_HANDLE pll, ok_DividerSource divsrc, int n);
__declspec(dllimport) void __stdcall okPLL22150_SetDiv2(okPLL22150_HANDLE pll, ok_DividerSource divsrc, int n);
__declspec(dllimport) ok_DividerSource __stdcall okPLL22150_GetDiv1Source(okPLL22150_HANDLE pll);
__declspec(dllimport) ok_DividerSource __stdcall okPLL22150_GetDiv2Source(okPLL22150_HANDLE pll);
__declspec(dllimport) int __stdcall okPLL22150_GetDiv1Divider(okPLL22150_HANDLE pll);
__declspec(dllimport) int __stdcall okPLL22150_GetDiv2Divider(okPLL22150_HANDLE pll);
__declspec(dllimport) void __stdcall okPLL22150_SetOutputSource(okPLL22150_HANDLE pll, int output, ok_ClockSource_22150 clksrc);
__declspec(dllimport) void __stdcall okPLL22150_SetOutputEnable(okPLL22150_HANDLE pll, int output, Bool enable);
__declspec(dllimport) ok_ClockSource_22150 __stdcall okPLL22150_GetOutputSource(okPLL22150_HANDLE pll, int output);
__declspec(dllimport) double __stdcall okPLL22150_GetOutputFrequency(okPLL22150_HANDLE pll, int output);
__declspec(dllimport) Bool __stdcall okPLL22150_IsOutputEnabled(okPLL22150_HANDLE pll, int output);
__declspec(dllimport) void __stdcall okPLL22150_InitFromProgrammingInfo(okPLL22150_HANDLE pll, unsigned char *buf);
__declspec(dllimport) void __stdcall okPLL22150_GetProgrammingInfo(okPLL22150_HANDLE pll, unsigned char *buf);





__declspec(dllimport) okDeviceSettings_HANDLE __stdcall okDeviceSettings_Construct();
__declspec(dllimport) void __stdcall okDeviceSettings_Destruct(okDeviceSettings_HANDLE hnd);
__declspec(dllimport) ok_ErrorCode __stdcall okDeviceSettings_GetString(okDeviceSettings_HANDLE hnd, const char *key, int length, char *buf);
__declspec(dllimport) ok_ErrorCode __stdcall okDeviceSettings_SetString(okDeviceSettings_HANDLE hnd, const char *key, const char *buf);
__declspec(dllimport) ok_ErrorCode __stdcall okDeviceSettings_GetInt(okDeviceSettings_HANDLE hnd, const char *key, UINT32 *value);
__declspec(dllimport) ok_ErrorCode __stdcall okDeviceSettings_SetInt(okDeviceSettings_HANDLE hnd, const char *key, UINT32 value);
__declspec(dllimport) ok_ErrorCode __stdcall okDeviceSettings_Delete(okDeviceSettings_HANDLE hnd, const char *key);
__declspec(dllimport) ok_ErrorCode __stdcall okDeviceSettings_Save(okDeviceSettings_HANDLE hnd);




__declspec(dllimport) okFirmwarePackage_HANDLE __stdcall okFirmwarePackage_Load(const char *filename);
__declspec(dllimport) void __stdcall okFirmwarePackage_Destruct(okFirmwarePackage_HANDLE hnd);
__declspec(dllimport) int __stdcall okFirmwarePackage_GetFirmwareCount(okFirmwarePackage_HANDLE hnd);
__declspec(dllimport) okFirmware_HANDLE __stdcall okFirmwarePackage_GetFirmware(okFirmwarePackage_HANDLE hnd, int num);

typedef void (*okFirmware_PerformTasks_Callback)(void*, int, const char*);
__declspec(dllimport) ok_ErrorCode __stdcall okFirmware_PerformTasks(okFirmware_HANDLE hnd, const char *serial, okFirmware_PerformTasks_Callback callback, void *arg);




__declspec(dllimport) okFrontPanel_HANDLE __stdcall okFrontPanel_Construct();
__declspec(dllimport) void __stdcall okFrontPanel_Destruct(okFrontPanel_HANDLE hnd);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_WriteI2C(okFrontPanel_HANDLE hnd, const int addr, int length, unsigned char *data);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_ReadI2C(okFrontPanel_HANDLE hnd, const int addr, int length, unsigned char *data);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_FlashEraseSector(okFrontPanel_HANDLE hnd, UINT32 address);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_FlashWrite(okFrontPanel_HANDLE hnd, UINT32 address, UINT32 length, const UINT8 *buf);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_FlashRead(okFrontPanel_HANDLE hnd, UINT32 address, UINT32 length, UINT8 *buf);




__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_ReadRegister(okFrontPanel_HANDLE hnd, UINT32 addr, UINT32 *data);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_ReadRegisters(okFrontPanel_HANDLE hnd, unsigned num, okTRegisterEntry* regs);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_WriteRegister(okFrontPanel_HANDLE hnd, UINT32 addr, UINT32 data);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_WriteRegisters(okFrontPanel_HANDLE hnd, unsigned num, const okTRegisterEntry* regs);
__declspec(dllimport) int __stdcall okFrontPanel_GetHostInterfaceWidth(okFrontPanel_HANDLE hnd);
__declspec(dllimport) Bool __stdcall okFrontPanel_IsHighSpeed(okFrontPanel_HANDLE hnd);
__declspec(dllimport) ok_BoardModel __stdcall okFrontPanel_GetBoardModel(okFrontPanel_HANDLE hnd);
__declspec(dllimport) void __stdcall okFrontPanel_GetBoardModelString(okFrontPanel_HANDLE hnd, ok_BoardModel m, char *buf);
__declspec(dllimport) int __stdcall okFrontPanel_GetDeviceCount(okFrontPanel_HANDLE hnd);
__declspec(dllimport) ok_BoardModel __stdcall okFrontPanel_GetDeviceListModel(okFrontPanel_HANDLE hnd, int num);
__declspec(dllimport) void __stdcall okFrontPanel_GetDeviceListSerial(okFrontPanel_HANDLE hnd, int num, char *buf);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_OpenBySerial(okFrontPanel_HANDLE hnd, const char *serial);
__declspec(dllimport) Bool __stdcall okFrontPanel_IsOpen(okFrontPanel_HANDLE hnd);
__declspec(dllimport) void __stdcall okFrontPanel_EnableAsynchronousTransfers(okFrontPanel_HANDLE hnd, Bool enable);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_SetBTPipePollingInterval(okFrontPanel_HANDLE hnd, int interval);
__declspec(dllimport) void __stdcall okFrontPanel_SetTimeout(okFrontPanel_HANDLE hnd, int timeout);
__declspec(dllimport) int __stdcall okFrontPanel_GetDeviceMajorVersion(okFrontPanel_HANDLE hnd);
__declspec(dllimport) int __stdcall okFrontPanel_GetDeviceMinorVersion(okFrontPanel_HANDLE hnd);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_ResetFPGA(okFrontPanel_HANDLE hnd);
__declspec(dllimport) void __stdcall okFrontPanel_Close(okFrontPanel_HANDLE hnd);
__declspec(dllimport) void __stdcall okFrontPanel_GetSerialNumber(okFrontPanel_HANDLE hnd, char *buf);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_GetDeviceSettings(okFrontPanel_HANDLE hnd, okDeviceSettings_HANDLE settings);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_GetDeviceInfo(okFrontPanel_HANDLE hnd, okTDeviceInfo *info);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_GetDeviceInfoWithSize(okFrontPanel_HANDLE hnd, okTDeviceInfo *info, unsigned size);
__declspec(dllimport) void __stdcall okFrontPanel_GetDeviceID(okFrontPanel_HANDLE hnd, char *buf);
__declspec(dllimport) void __stdcall okFrontPanel_SetDeviceID(okFrontPanel_HANDLE hnd, const char *strID);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_ConfigureFPGA(okFrontPanel_HANDLE hnd, const char *strFilename);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_ConfigureFPGAFromMemory(okFrontPanel_HANDLE hnd, unsigned char *data, unsigned long length);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_GetPLL22150Configuration(okFrontPanel_HANDLE hnd, okPLL22150_HANDLE pll);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_SetPLL22150Configuration(okFrontPanel_HANDLE hnd, okPLL22150_HANDLE pll);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_GetEepromPLL22150Configuration(okFrontPanel_HANDLE hnd, okPLL22150_HANDLE pll);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_SetEepromPLL22150Configuration(okFrontPanel_HANDLE hnd, okPLL22150_HANDLE pll);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_GetPLL22393Configuration(okFrontPanel_HANDLE hnd, okPLL22393_HANDLE pll);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_SetPLL22393Configuration(okFrontPanel_HANDLE hnd, okPLL22393_HANDLE pll);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_GetEepromPLL22393Configuration(okFrontPanel_HANDLE hnd, okPLL22393_HANDLE pll);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_SetEepromPLL22393Configuration(okFrontPanel_HANDLE hnd, okPLL22393_HANDLE pll);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_LoadDefaultPLLConfiguration(okFrontPanel_HANDLE hnd);
__declspec(dllimport) Bool __stdcall okFrontPanel_IsFrontPanelEnabled(okFrontPanel_HANDLE hnd);
__declspec(dllimport) Bool __stdcall okFrontPanel_IsFrontPanel3Supported(okFrontPanel_HANDLE hnd);
__declspec(dllimport) void __stdcall okFrontPanel_UpdateWireIns(okFrontPanel_HANDLE hnd);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_GetWireInValue(okFrontPanel_HANDLE hnd, int epAddr, UINT32 *val);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_SetWireInValue(okFrontPanel_HANDLE hnd, int ep, unsigned long val, unsigned long mask);
__declspec(dllimport) void __stdcall okFrontPanel_UpdateWireOuts(okFrontPanel_HANDLE hnd);
__declspec(dllimport) unsigned long __stdcall okFrontPanel_GetWireOutValue(okFrontPanel_HANDLE hnd, int epAddr);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanel_ActivateTriggerIn(okFrontPanel_HANDLE hnd, int epAddr, int bit);
__declspec(dllimport) void __stdcall okFrontPanel_UpdateTriggerOuts(okFrontPanel_HANDLE hnd);
__declspec(dllimport) Bool __stdcall okFrontPanel_IsTriggered(okFrontPanel_HANDLE hnd, int epAddr, unsigned long mask);
__declspec(dllimport) long __stdcall okFrontPanel_GetLastTransferLength(okFrontPanel_HANDLE hnd);
__declspec(dllimport) long __stdcall okFrontPanel_WriteToPipeIn(okFrontPanel_HANDLE hnd, int epAddr, long length, unsigned char *data);
__declspec(dllimport) long __stdcall okFrontPanel_ReadFromPipeOut(okFrontPanel_HANDLE hnd, int epAddr, long length, unsigned char *data);
__declspec(dllimport) long __stdcall okFrontPanel_WriteToBlockPipeIn(okFrontPanel_HANDLE hnd, int epAddr, int blockSize, long length, unsigned char *data);
__declspec(dllimport) long __stdcall okFrontPanel_ReadFromBlockPipeOut(okFrontPanel_HANDLE hnd, int epAddr, int blockSize, long length, unsigned char *data);





__declspec(dllimport) okCFrontPanelManager_HANDLE __stdcall okFrontPanelManager_Construct(okFrontPanelManager_HANDLE self);
__declspec(dllimport) void __stdcall okFrontPanelManager_Destruct(okCFrontPanelManager_HANDLE hnd);
__declspec(dllimport) ok_ErrorCode __stdcall okFrontPanelManager_StartMonitoring(okCFrontPanelManager_HANDLE hnd);
__declspec(dllimport) okFrontPanel_HANDLE __stdcall okFrontPanelManager_Open(okCFrontPanelManager_HANDLE hnd, const char *serial);






















































































































































































































































































































































































































































































































































































































































































































#line 1179 "C:\\Users\\Roman Genov\\Documents\\csm_pkg_rel1.1_activepxl\\okFrontPanelDLL.h"

