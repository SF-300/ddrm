module ddrm.xf86drm;

import core.stdc.stdarg;
import core.sys.posix.sys.types;
import core.stdc.config;
import ddrm.drm : drm_context_t, drm_handle_t, drm_magic_t, drm_drawable_t, drm_drawable_info_type_t;


extern(C):

alias uint drmSize;
alias uint* drmSizePtr;
alias void* drmAddress;
alias void** drmAddressPtr;

enum drmMapType {
    DRM_FRAME_BUFFER = 0,
    DRM_REGISTERS = 1,
    DRM_SHM = 2,
    DRM_AGP = 3,
    DRM_SCATTER_GATHER = 4,
    DRM_CONSISTENT = 5
}

enum drmMapFlags {
    DRM_RESTRICTED = 1,
    DRM_READ_ONLY = 2,
    DRM_LOCKED = 4,
    DRM_KERNEL = 8,
    DRM_WRITE_COMBINING = 16,
    DRM_CONTAINS_LOCK = 32,
    DRM_REMOVABLE = 64
}

enum drmDMAFlags {
    DRM_DMA_BLOCK = 1,
    DRM_DMA_WHILE_LOCKED = 2,
    DRM_DMA_PRIORITY = 4,
    DRM_DMA_WAIT = 16,
    DRM_DMA_SMALLER_OK = 32,
    DRM_DMA_LARGER_OK = 64
}

enum drmBufDescFlags {
    DRM_PAGE_ALIGN = 1,
    DRM_AGP_BUFFER = 2,
    DRM_SG_BUFFER = 4,
    DRM_FB_BUFFER = 8,
    DRM_PCI_BUFFER_RO = 16
}

enum drmLockFlags {
    DRM_LOCK_READY = 1,
    DRM_LOCK_QUIESCENT = 2,
    DRM_LOCK_FLUSH = 4,
    DRM_LOCK_FLUSH_ALL = 8,
    DRM_HALT_ALL_QUEUES = 16,
    DRM_HALT_CUR_QUEUES = 32
}

alias drm_context_tFlagsPtr = drm_context_tFlags*;
enum drm_context_tFlags {
    DRM_CONTEXT_PRESERVED = 1,
    DRM_CONTEXT_2DONLY = 2
}

enum drmVBlankSeqType {
    DRM_VBLANK_ABSOLUTE = 0,
    DRM_VBLANK_RELATIVE = 1,
    DRM_VBLANK_HIGH_CRTC_MASK = 62,
    DRM_VBLANK_EVENT = 67108864,
    DRM_VBLANK_FLIP = 134217728,
    DRM_VBLANK_NEXTONMISS = 268435456,
    DRM_VBLANK_SECONDARY = 536870912,
    DRM_VBLANK_SIGNAL = 1073741824
}

alias drmServerInfoPtr = drmServerInfo*;
struct drmServerInfo {
    int function(const(char)*, va_list) debug_print;
    int function(const(char)*) load_module;
    void function(gid_t*, mode_t*) get_perms;
}

struct drmHashEntry {
    int fd;
    void function(int, void*, void*) f;
    void* tagTable;
}

alias drmVersionPtr = drmVersion*;
struct drmVersion {
    int version_major;
    int version_minor;
    int version_patchlevel;
    int name_len;
    char* name;
    int date_len;
    char* date;
    int desc_len;
    char* desc;
}

struct drmStatsT {
    c_ulong count;
    private struct data_t {
    	c_ulong value;
    	const(char)* long_format;
    	const(char)* long_name;
    	const(char)* rate_format;
    	const(char)* rate_name;
    	int isvalue;
    	const(char)* mult_names;
    	int mult;
    	int verbose;
    }
    data_t[15] data;
}

alias drmBufDescPtr = drmBufDesc*;
struct drmBufDesc {
    int count;
    int size;
    int low_mark;
    int high_mark;
}

alias drmBufInfoPtr = drmBufInfo*;
struct drmBufInfo {
    int count;
    drmBufDescPtr list;
}

alias drmBufPtr = drmBuf*;
struct drmBuf {
    int idx;
    int total;
    int used;
    drmAddress address;
}

alias drmBufMapPtr = drmBufMap*;
struct drmBufMap {
    int count;
    drmBufPtr list;
}

alias drmLockPtr = drmLock*;
struct drmLock {
    uint lock;
    char[60] padding;
}

alias drmDMAReqPtr = drmDMAReq*;
struct drmDMAReq {
    drm_context_t context;
    int send_count;
    int* send_list;
    int* send_sizes;
    drmDMAFlags flags;
    int request_count;
    int request_size;
    int* request_list;
    int* request_sizes;
    int granted_count;
}

alias drmRegionPtr = drmRegion*;
struct drmRegion {
    drm_handle_t handle;
    uint offset;
    drmSize size;
    drmAddress map;
}

alias drmTextureRegionPtr = drmTextureRegion*;
struct drmTextureRegion {
    ubyte next;
    ubyte prev;
    ubyte in_use;
    ubyte padding;
    uint age;
}

alias drmVBlankReqPtr = drmVBlankReq*;
struct drmVBlankReq {
    drmVBlankSeqType type;
    uint sequence;
    c_ulong signal;
}

alias drmVBlankReplyPtr = drmVBlankReply*;
struct drmVBlankReply {
    drmVBlankSeqType type;
    uint sequence;
    c_long tval_sec;
    c_long tval_usec;
}

alias drmSetVersionPtr = drmSetVersion*;
struct drmSetVersion {
    int drm_di_major;
    int drm_di_minor;
    int drm_dd_major;
    int drm_dd_minor;
}

alias drmEventContextPtr = drmEventContext*;
struct drmEventContext {
    int version_;
    void function(int, uint, uint, uint, void*) vblank_handler;
    void function(int, uint, uint, uint, void*) page_flip_handler;
}

alias drmVBlankPtr = drmVBlank*;
union drmVBlank {
    drmVBlankReq request;
    drmVBlankReply reply;
}


int drmIoctl(int fd, c_ulong request, void* arg);
void* drmGetHashTable();
drmHashEntry* drmGetEntry(int fd);
int drmAvailable();
int drmOpen(const(char)* name, const(char)* busid);
int drmOpenControl(int minor);
int drmClose(int fd);
drmVersionPtr drmGetVersion(int fd);
drmVersionPtr drmGetLibVersion(int fd);
int drmGetCap(int fd, ulong capability, ulong* value);
void drmFreeVersion(drmVersionPtr);
int drmGetMagic(int fd, drm_magic_t* magic);
char* drmGetBusid(int fd);
int drmGetInterruptFromBusID(int fd, int busnum, int devnum, int funcnum);
int drmGetMap(int fd, int idx, drm_handle_t* offset, drmSize* size, drmMapType* type, drmMapFlags* flags, drm_handle_t* handle, int* mtrr);
int drmGetClient(int fd, int idx, int* auth, int* pid, int* uid, c_ulong* magic, c_ulong* iocs);
int drmGetStats(int fd, drmStatsT* stats);
int drmSetInterfaceVersion(int fd, drmSetVersion* version_);
int drmCommandNone(int fd, c_ulong drmCommandIndex);
int drmCommandRead(int fd, c_ulong drmCommandIndex, void* data, c_ulong size);
int drmCommandWrite(int fd, c_ulong drmCommandIndex, void* data, c_ulong size);
int drmCommandWriteRead(int fd, c_ulong drmCommandIndex, void* data, c_ulong size);
void drmFreeBusid(const(char)* busid);
int drmSetBusid(int fd, const(char)* busid);
int drmAuthMagic(int fd, drm_magic_t magic);
int drmAddMap(int fd, drm_handle_t offset, drmSize size, drmMapType type, drmMapFlags flags, drm_handle_t* handle);
int drmRmMap(int fd, drm_handle_t handle);
int drmAddContextPrivateMapping(int fd, drm_context_t ctx_id, drm_handle_t handle);
int drmAddBufs(int fd, int count, int size, drmBufDescFlags flags, int agp_offset);
int drmMarkBufs(int fd, double low, double high);
int drmCreateContext(int fd, drm_context_t* handle);
int drmSetContextFlags(int fd, drm_context_t context, drm_context_tFlags flags);
int drmGetContextFlags(int fd, drm_context_t context, drm_context_tFlagsPtr flags);
int drmAddContextTag(int fd, drm_context_t context, void* tag);
int drmDelContextTag(int fd, drm_context_t context);
void* drmGetContextTag(int fd, drm_context_t context);
drm_context_t* drmGetReservedContextList(int fd, int* count);
void drmFreeReservedContextList(drm_context_t*);
int drmSwitchToContext(int fd, drm_context_t context);
int drmDestroyContext(int fd, drm_context_t handle);
int drmCreateDrawable(int fd, drm_drawable_t* handle);
int drmDestroyDrawable(int fd, drm_drawable_t handle);
int drmUpdateDrawableInfo(int fd, drm_drawable_t handle, drm_drawable_info_type_t type, uint num, void* data);
int drmCtlInstHandler(int fd, int irq);
int drmCtlUninstHandler(int fd);
int drmSetClientCap(int fd, ulong capability, ulong value);
int drmMap(int fd, drm_handle_t handle, drmSize size, drmAddressPtr address);
int drmUnmap(drmAddress address, drmSize size);
drmBufInfoPtr drmGetBufInfo(int fd);
drmBufMapPtr drmMapBufs(int fd);
int drmUnmapBufs(drmBufMapPtr bufs);
int drmDMA(int fd, drmDMAReqPtr request);
int drmFreeBufs(int fd, int count, int* list);
int drmGetLock(int fd, drm_context_t context, drmLockFlags flags);
int drmUnlock(int fd, drm_context_t context);
int drmFinish(int fd, int context, drmLockFlags flags);
int drmGetContextPrivateMapping(int fd, drm_context_t ctx_id, drm_handle_t* handle);
int drmAgpAcquire(int fd);
int drmAgpRelease(int fd);
int drmAgpEnable(int fd, c_ulong mode);
int drmAgpAlloc(int fd, c_ulong size, c_ulong type, c_ulong* address, drm_handle_t* handle);
int drmAgpFree(int fd, drm_handle_t handle);
int drmAgpBind(int fd, drm_handle_t handle, c_ulong offset);
int drmAgpUnbind(int fd, drm_handle_t handle);
int drmAgpVersionMajor(int fd);
int drmAgpVersionMinor(int fd);
c_ulong drmAgpGetMode(int fd);
c_ulong drmAgpBase(int fd);
c_ulong drmAgpSize(int fd);
c_ulong drmAgpMemoryUsed(int fd);
c_ulong drmAgpMemoryAvail(int fd);
uint drmAgpVendorId(int fd);
uint drmAgpDeviceId(int fd);
int drmScatterGatherAlloc(int fd, c_ulong size, drm_handle_t* handle);
int drmScatterGatherFree(int fd, drm_handle_t handle);
int drmWaitVBlank(int fd, drmVBlankPtr vbl);
void drmSetServerInfo(drmServerInfoPtr info);
int drmError(int err, const(char)* label);
void* drmMalloc(int size);
void drmFree(void* pt);
void* drmHashCreate();
int drmHashDestroy(void* t);
int drmHashLookup(void* t, c_ulong key, void** value);
int drmHashInsert(void* t, c_ulong key, void* value);
int drmHashDelete(void* t, c_ulong key);
int drmHashFirst(void* t, c_ulong* key, void** value);
int drmHashNext(void* t, c_ulong* key, void** value);
void* drmRandomCreate(c_ulong seed);
int drmRandomDestroy(void* state);
c_ulong drmRandom(void* state);
double drmRandomDouble(void* state);
void* drmSLCreate();
int drmSLDestroy(void* l);
int drmSLLookup(void* l, c_ulong key, void** value);
int drmSLInsert(void* l, c_ulong key, void* value);
int drmSLDelete(void* l, c_ulong key);
int drmSLNext(void* l, c_ulong* key, void** value);
int drmSLFirst(void* l, c_ulong* key, void** value);
void drmSLDump(void* l);
int drmSLLookupNeighbors(void* l, c_ulong key, c_ulong* prev_key, void** prev_value, c_ulong* next_key, void** next_value);
int drmOpenOnce(void* unused, const(char)* BusID, int* newlyopened);
void drmCloseOnce(int fd);
void drmMsg(const(char)* format, ...);
int drmSetMaster(int fd);
int drmDropMaster(int fd);
int drmHandleEvent(int fd, drmEventContextPtr evctx);
char* drmGetDeviceNameFromFd(int fd);
int drmPrimeHandleToFD(int fd, uint handle, uint flags, int* prime_fd);
int drmPrimeFDToHandle(int fd, int prime_fd, uint* handle);