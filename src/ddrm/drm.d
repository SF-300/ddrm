module ddrm.drm;

import core.stdc.config : c_ulong, c_long;
import core.sys.posix.sys.ioctl : _IOR, _IOW, _IOWR, _IO;
import ddrm.drm_mode : drm_mode_card_res, drm_mode_crtc, drm_mode_cursor, drm_mode_crtc_lut, drm_mode_get_encoder, drm_mode_get_connector, drm_mode_mode_cmd, drm_mode_property_enum;


extern (C):

// TODO: Should it really be hardcoded in the bindings?
enum {
	DRM_NAME = "drm",
	DRM_MIN_ORDER = 5,
	DRM_MAX_ORDER = 22,
	DRM_RAM_PERCENT = 10
}

enum DRM_CLIENT_CAP_STEREO_3D = 1;

enum DRM_CLIENT_CAP_UNIVERSAL_PLANES = 2;

//enum DRM_CLOEXEC = O_CLOEXEC;

enum DRM_IOCTL_BASE = 'd';

enum {
	DRM_IOCTL_VERSION =_IOWR!drm_version(0x00),
	DRM_IOCTL_GET_UNIQUE =_IOWR!drm_unique(0x01),
	DRM_IOCTL_GET_MAGIC =_IOR!drm_auth(0x02),
	DRM_IOCTL_IRQ_BUSID =_IOWR!drm_irq_busid(0x03),
	DRM_IOCTL_GET_MAP =_IOWR!drm_map(0x04),
	DRM_IOCTL_GET_CLIENT =_IOWR!drm_client(0x05),
	DRM_IOCTL_GET_STATS =_IOR!drm_stats(0x06),
	DRM_IOCTL_SET_VERSION =_IOWR!drm_set_version(0x07),
	DRM_IOCTL_MODESET_CTL =_IOW!drm_modeset_ctl(0x08),
	DRM_IOCTL_GEM_CLOSE =_IOW!drm_gem_close(0x09),
	DRM_IOCTL_GEM_FLINK =_IOWR!drm_gem_flink(0x0a),
	DRM_IOCTL_GEM_OPEN =_IOWR!drm_gem_open(0x0b),
	DRM_IOCTL_GET_CAP =_IOWR!drm_get_cap(0x0c),
	DRM_IOCTL_SET_CLIENT_CAP =_IOW!drm_set_client_cap(0x0d)
}

enum {
	DRM_IOCTL_SET_UNIQUE =_IOW!drm_unique(0x10),
	DRM_IOCTL_AUTH_MAGIC =_IOW!drm_auth(0x11),
	DRM_IOCTL_BLOCK =_IOWR!drm_block(0x12),
	DRM_IOCTL_UNBLOCK =_IOWR!drm_block(0x13),
	DRM_IOCTL_CONTROL =_IOW!drm_control(0x14),
	DRM_IOCTL_ADD_MAP =_IOWR!drm_map(0x15),
	DRM_IOCTL_ADD_BUFS =_IOWR!drm_buf_desc(0x16),
	DRM_IOCTL_MARK_BUFS =_IOW!drm_buf_desc(0x17),
	DRM_IOCTL_INFO_BUFS =_IOWR!drm_buf_info(0x18),
	DRM_IOCTL_MAP_BUFS =_IOWR!drm_buf_map(0x19),
	DRM_IOCTL_FREE_BUFS =_IOW!drm_buf_free(0x1a)
}

enum DRM_IOCTL_RM_MAP =_IOW!drm_map(0x1b);

enum {
	DRM_IOCTL_SET_SAREA_CTX =_IOW!drm_ctx_priv_map(0x1c),
	DRM_IOCTL_GET_SAREA_CTX =_IOWR!drm_ctx_priv_map(0x1d)
}

enum {
	DRM_IOCTL_SET_MASTER = _IO(DRM_IOCTL_BASE, 0x1e),
	DRM_IOCTL_DROP_MASTER = _IO(DRM_IOCTL_BASE, 0x1f)
}

enum {
	DRM_IOCTL_ADD_CTX =_IOWR!drm_ctx(0x20),
	DRM_IOCTL_RM_CTX =_IOWR!drm_ctx(0x21),
	DRM_IOCTL_MOD_CTX =_IOW!drm_ctx(0x22),
	DRM_IOCTL_GET_CTX =_IOWR!drm_ctx(0x23),
	DRM_IOCTL_SWITCH_CTX =_IOW!drm_ctx(0x24),
	DRM_IOCTL_NEW_CTX =_IOW!drm_ctx(0x25),
	DRM_IOCTL_RES_CTX =_IOWR!drm_ctx_res(0x26),
	DRM_IOCTL_ADD_DRAW =_IOWR!drm_draw(0x27),
	DRM_IOCTL_RM_DRAW =_IOWR!drm_draw(0x28),
	DRM_IOCTL_DMA =_IOWR!drm_dma(0x29),
	DRM_IOCTL_LOCK =_IOW!drm_lock(0x2a),
	DRM_IOCTL_UNLOCK =_IOW!drm_lock(0x2b),
	DRM_IOCTL_FINISH =_IOW!drm_lock(0x2c)
}

enum {
	DRM_IOCTL_PRIME_HANDLE_TO_FD =_IOWR!drm_prime_handle(0x2d),
	DRM_IOCTL_PRIME_FD_TO_HANDLE =_IOWR!drm_prime_handle(0x2e)
}

enum {
	DRM_IOCTL_AGP_ACQUIRE =_IO(0x30),
	DRM_IOCTL_AGP_RELEASE =_IO(0x31),
	DRM_IOCTL_AGP_ENABLE =_IOW!drm_agp_mode(0x32),
	DRM_IOCTL_AGP_INFO =_IOR!drm_agp_info(0x33),
	DRM_IOCTL_AGP_ALLOC =_IOWR!drm_agp_buffer(0x34),
	DRM_IOCTL_AGP_FREE =_IOW!drm_agp_buffer(0x35),
	DRM_IOCTL_AGP_BIND =_IOW!drm_agp_binding(0x36),
	DRM_IOCTL_AGP_UNBIND =_IOW!drm_agp_binding(0x37)
}

enum {
	DRM_IOCTL_SG_ALLOC =_IOWR!drm_scatter_gather(0x38),
	DRM_IOCTL_SG_FREE =_IOW!drm_scatter_gather(0x39)
}

enum DRM_IOCTL_WAIT_VBLANK =_IOWR!drm_wait_vblank(0x3a);

enum DRM_IOCTL_UPDATE_DRAW =_IOW!drm_update_draw(0x3f);

enum {
	DRM_IOCTL_MODE_GETRESOURCES	= _IOWR!drm_mode_card_res(DRM_IOCTL_BASE, 0xA0),
    DRM_IOCTL_MODE_GETCRTC		= _IOWR!drm_mode_crtc(DRM_IOCTL_BASE, 0xA1),
    DRM_IOCTL_MODE_SETCRTC		= _IOWR!drm_mode_crtc(DRM_IOCTL_BASE, 0xA2),
    DRM_IOCTL_MODE_CURSOR		= _IOWR!drm_mode_cursor(DRM_IOCTL_BASE, 0xA3),
    DRM_IOCTL_MODE_GETGAMMA		= _IOWR!drm_mode_crtc_lut(DRM_IOCTL_BASE, 0xA4),
    DRM_IOCTL_MODE_SETGAMMA		= _IOWR!drm_mode_crtc_lut(DRM_IOCTL_BASE, 0xA5),
    DRM_IOCTL_MODE_GETENCODER	= _IOWR!drm_mode_get_encoder(DRM_IOCTL_BASE, 0xA6),
    DRM_IOCTL_MODE_GETCONNECTOR	= _IOWR!drm_mode_get_connector(DRM_IOCTL_BASE, 0xA7),
    DRM_IOCTL_MODE_ATTACHMODE	= _IOWR!drm_mode_mode_cmd(DRM_IOCTL_BASE, 0xA8),
    DRM_IOCTL_MODE_DETACHMODE	= _IOWR!drm_mode_mode_cmd(DRM_IOCTL_BASE, 0xA9)
}

enum {
	DRM_IOCTL_MODE_GETPROPERTY =_IOWR!drm_mode_get_property(0xAA),
	DRM_IOCTL_MODE_SETPROPERTY =_IOWR!drm_mode_connector_set_property(0xAB),
	DRM_IOCTL_MODE_GETPROPBLOB =_IOWR!drm_mode_get_blob(0xAC),
	DRM_IOCTL_MODE_GETFB =_IOWR!drm_mode_fb_cmd(0xAD),
	DRM_IOCTL_MODE_ADDFB =_IOWR!drm_mode_fb_cmd(0xAE),
	DRM_IOCTL_MODE_RMFB =_IOWR!uint(0xAF),
	DRM_IOCTL_MODE_PAGE_FLIP =_IOWR!drm_mode_crtc_page_flip(0xB0),
	DRM_IOCTL_MODE_DIRTYFB =_IOWR!drm_mode_fb_dirty_cmd(0xB1)
}

enum {
	DRM_IOCTL_MODE_CREATE_DUMB =_IOWR!drm_mode_create_dumb(0xB2),
	DRM_IOCTL_MODE_MAP_DUMB =_IOWR!drm_mode_map_dumb(0xB3),
	DRM_IOCTL_MODE_DESTROY_DUMB =_IOWR!drm_mode_destroy_dumb(0xB4),
	DRM_IOCTL_MODE_GETPLANERESOURCES =_IOWR!drm_mode_get_plane_res(0xB5),
	DRM_IOCTL_MODE_GETPLANE =_IOWR!drm_mode_get_plane(0xB6),
	DRM_IOCTL_MODE_SETPLANE =_IOWR!drm_mode_set_plane(0xB7),
	DRM_IOCTL_MODE_ADDFB2 =_IOWR!drm_mode_fb_cmd2(0xB8),
	DRM_IOCTL_MODE_OBJ_GETPROPERTIES =_IOWR!drm_mode_obj_get_properties(0xB9),
	DRM_IOCTL_MODE_OBJ_SETPROPERTY =_IOWR!drm_mode_obj_set_property(0xBA),
	DRM_IOCTL_MODE_CURSOR2 =_IOWR!drm_mode_cursor2(0xBB)
}

enum {
	DRM_COMMAND_BASE = 0x40,
	DRM_COMMAND_END = 0xA0
}

enum {
	DRM_EVENT_VBLANK = 0x01,
	DRM_EVENT_FLIP_COMPLETE = 0x02
}

enum {
	DRM_CAP_DUMB_BUFFER = 0x1,
	DRM_CAP_VBLANK_HIGH_CRTC = 0x2,
	DRM_CAP_DUMB_PREFERRED_DEPTH = 0x3,
	DRM_CAP_DUMB_PREFER_SHADOW = 0x4,
	DRM_CAP_PRIME = 0x5,
	DRM_CAP_TIMESTAMP_MONOTONIC = 0x6,
	DRM_CAP_ASYNC_PAGE_FLIP = 0x7
}

enum {
	DRM_PRIME_CAP_IMPORT = 0x1,
	DRM_PRIME_CAP_EXPORT = 0x2
}


alias uint drm_handle_t;
alias uint drm_context_t;
alias uint drm_drawable_t;
alias uint drm_magic_t;
alias drm_clip_rect drm_clip_rect_t;
alias drm_drawable_info drm_drawable_info_t;
alias drm_tex_region drm_tex_region_t;
alias drm_hw_lock drm_hw_lock_t;
alias drm_version drm_version_t;
alias drm_unique drm_unique_t;
alias drm_list drm_list_t;
alias drm_block drm_block_t;
alias drm_control drm_control_t;
alias drm_map_type drm_map_type_t;
alias drm_map_flags drm_map_flags_t;
alias drm_ctx_priv_map drm_ctx_priv_map_t;
alias drm_map drm_map_t;
alias drm_client drm_client_t;
alias drm_stat_type drm_stat_type_t;
alias drm_stats drm_stats_t;
alias drm_lock_flags drm_lock_flags_t;
alias drm_lock drm_lock_t;
alias drm_dma_flags drm_dma_flags_t;
alias drm_buf_desc drm_buf_desc_t;
alias drm_buf_info drm_buf_info_t;
alias drm_buf_free drm_buf_free_t;
alias drm_buf_pub drm_buf_pub_t;
alias drm_buf_map drm_buf_map_t;
alias drm_dma drm_dma_t;
alias drm_wait_vblank drm_wait_vblank_t;
alias drm_agp_mode drm_agp_mode_t;
alias drm_ctx_flags drm_ctx_flags_t;
alias drm_ctx drm_ctx_t;
alias drm_ctx_res drm_ctx_res_t;
alias drm_draw drm_draw_t;
alias drm_update_draw drm_update_draw_t;
alias drm_auth drm_auth_t;
alias drm_irq_busid drm_irq_busid_t;
alias drm_vblank_seq_type drm_vblank_seq_type_t;
alias drm_agp_buffer drm_agp_buffer_t;
alias drm_agp_binding drm_agp_binding_t;
alias drm_agp_info drm_agp_info_t;
alias drm_scatter_gather drm_scatter_gather_t;
alias drm_set_version drm_set_version_t;

enum drm_map_type {
    _DRM_FRAME_BUFFER = 0,
    _DRM_REGISTERS = 1,
    _DRM_SHM = 2,
    _DRM_AGP = 3,
    _DRM_SCATTER_GATHER = 4,
    _DRM_CONSISTENT = 5,
    _DRM_GEM = 6
}

enum drm_map_flags {
    _DRM_RESTRICTED = 1,
    _DRM_READ_ONLY = 2,
    _DRM_LOCKED = 4,
    _DRM_KERNEL = 8,
    _DRM_WRITE_COMBINING = 16,
    _DRM_CONTAINS_LOCK = 32,
    _DRM_REMOVABLE = 64,
    _DRM_DRIVER = 128
}

enum drm_stat_type {
    _DRM_STAT_LOCK = 0,
    _DRM_STAT_OPENS = 1,
    _DRM_STAT_CLOSES = 2,
    _DRM_STAT_IOCTLS = 3,
    _DRM_STAT_LOCKS = 4,
    _DRM_STAT_UNLOCKS = 5,
    _DRM_STAT_VALUE = 6,
    _DRM_STAT_BYTE = 7,
    _DRM_STAT_COUNT = 8,
    _DRM_STAT_IRQ = 9,
    _DRM_STAT_PRIMARY = 10,
    _DRM_STAT_SECONDARY = 11,
    _DRM_STAT_DMA = 12,
    _DRM_STAT_SPECIAL = 13,
    _DRM_STAT_MISSED = 14
}

enum drm_lock_flags {
    _DRM_LOCK_READY = 1,
    _DRM_LOCK_QUIESCENT = 2,
    _DRM_LOCK_FLUSH = 4,
    _DRM_LOCK_FLUSH_ALL = 8,
    _DRM_HALT_ALL_QUEUES = 16,
    _DRM_HALT_CUR_QUEUES = 32
}

enum drm_dma_flags {
    _DRM_DMA_BLOCK = 1,
    _DRM_DMA_WHILE_LOCKED = 2,
    _DRM_DMA_PRIORITY = 4,
    _DRM_DMA_WAIT = 16,
    _DRM_DMA_SMALLER_OK = 32,
    _DRM_DMA_LARGER_OK = 64
}

enum drm_ctx_flags {
    _DRM_CONTEXT_PRESERVED = 1,
    _DRM_CONTEXT_2DONLY = 2
}

enum drm_drawable_info_type_t {
    DRM_DRAWABLE_CLIPRECTS = 0
}

enum drm_vblank_seq_type {
    _DRM_VBLANK_ABSOLUTE = 0,
    _DRM_VBLANK_RELATIVE = 1,
    _DRM_VBLANK_EVENT = 67108864,
    _DRM_VBLANK_FLIP = 134217728,
    _DRM_VBLANK_NEXTONMISS = 268435456,
    _DRM_VBLANK_SECONDARY = 536870912,
    _DRM_VBLANK_SIGNAL = 1073741824
}

struct drm_clip_rect {
    ushort x1;
    ushort y1;
    ushort x2;
    ushort y2;
}

struct drm_drawable_info {
    uint num_rects;
    drm_clip_rect* rects;
}

struct drm_tex_region {
    ubyte next;
    ubyte prev;
    ubyte in_use;
    ubyte padding;
    uint age;
}

struct drm_hw_lock {
    uint lock;
    char[60] padding;
}

struct drm_version {
    int version_major;
    int version_minor;
    int version_patchlevel;
    size_t name_len;
    char* name;
    size_t date_len;
    char* date;
    size_t desc_len;
    char* desc;
}

struct drm_unique {
    size_t unique_len;
    char* unique;
}

struct drm_list {
    int count;
    drm_version* version_;
}

struct drm_block {
    int unused;
}

struct drm_control {
    enum _Anonymous_0 {
        DRM_ADD_COMMAND = 0,
        DRM_RM_COMMAND = 1,
        DRM_INST_HANDLER = 2,
        DRM_UNINST_HANDLER = 3
    }
    _Anonymous_0 func;
    int irq;
}

struct drm_ctx_priv_map {
    uint ctx_id;
    void* handle;
}

struct drm_map {
    c_ulong offset;
    c_ulong size;
    enum drm_map_type {
        _DRM_FRAME_BUFFER = 0,
        _DRM_REGISTERS = 1,
        _DRM_SHM = 2,
        _DRM_AGP = 3,
        _DRM_SCATTER_GATHER = 4,
        _DRM_CONSISTENT = 5,
        _DRM_GEM = 6
    }
    drm_map_type type;
    enum drm_map_flags {
        _DRM_RESTRICTED = 1,
        _DRM_READ_ONLY = 2,
        _DRM_LOCKED = 4,
        _DRM_KERNEL = 8,
        _DRM_WRITE_COMBINING = 16,
        _DRM_CONTAINS_LOCK = 32,
        _DRM_REMOVABLE = 64,
        _DRM_DRIVER = 128
    }
    drm_map_flags flags;
    void* handle;
    int mtrr;
}

struct drm_client {
    int idx;
    int auth;
    c_ulong pid;
    c_ulong uid;
    c_ulong magic;
    c_ulong iocs;
}

struct drm_stats {
    c_ulong count;
    private static struct _data {
        c_ulong value;
        drm_stat_type type;
    }
    _data[15] data;
}

struct drm_lock {
    int context;
    enum drm_lock_flags {
        _DRM_LOCK_READY = 1,
        _DRM_LOCK_QUIESCENT = 2,
        _DRM_LOCK_FLUSH = 4,
        _DRM_LOCK_FLUSH_ALL = 8,
        _DRM_HALT_ALL_QUEUES = 16,
        _DRM_HALT_CUR_QUEUES = 32
    }
    drm_lock_flags flags;
}

struct drm_buf_desc {
    int count;
    int size;
    int low_mark;
    int high_mark;
    enum _Anonymous_1 {
        _DRM_PAGE_ALIGN = 1,
        _DRM_AGP_BUFFER = 2,
        _DRM_SG_BUFFER = 4,
        _DRM_FB_BUFFER = 8,
        _DRM_PCI_BUFFER_RO = 16
    }
    _Anonymous_1 flags;
    c_ulong agp_start;
}

struct drm_buf_info {
    int count;
    drm_buf_desc* list;
}

struct drm_buf_free {
    int count;
    int* list;
}

struct drm_buf_pub {
    int idx;
    int total;
    int used;
    void* address;
}

struct drm_buf_map {
    int count;
    void* virt;
    drm_buf_pub* list;
}

struct drm_dma {
    int context;
    int send_count;
    int* send_indices;
    int* send_sizes;
    enum drm_dma_flags {
        _DRM_DMA_BLOCK = 1,
        _DRM_DMA_WHILE_LOCKED = 2,
        _DRM_DMA_PRIORITY = 4,
        _DRM_DMA_WAIT = 16,
        _DRM_DMA_SMALLER_OK = 32,
        _DRM_DMA_LARGER_OK = 64
    }
    drm_dma_flags flags;
    int request_count;
    int request_size;
    int* request_indices;
    int* request_sizes;
    int granted_count;
}

struct drm_ctx {
    drm_context_t handle;
    enum drm_ctx_flags {
        _DRM_CONTEXT_PRESERVED = 1,
        _DRM_CONTEXT_2DONLY = 2
    }
    drm_ctx_flags flags;
}

struct drm_ctx_res {
    int count;
    drm_ctx* contexts;
}

struct drm_draw {
    drm_drawable_t handle;
}

struct drm_update_draw {
    drm_drawable_t handle;
    uint type;
    uint num;
    ulong data;
}

struct drm_auth {
    drm_magic_t magic;
}

struct drm_irq_busid {
    int irq;
    int busnum;
    int devnum;
    int funcnum;
}

struct drm_wait_vblank_request {
    enum drm_vblank_seq_type {
        _DRM_VBLANK_ABSOLUTE = 0,
        _DRM_VBLANK_RELATIVE = 1,
        _DRM_VBLANK_EVENT = 67108864,
        _DRM_VBLANK_FLIP = 134217728,
        _DRM_VBLANK_NEXTONMISS = 268435456,
        _DRM_VBLANK_SECONDARY = 536870912,
        _DRM_VBLANK_SIGNAL = 1073741824
    }
    drm_vblank_seq_type type;
    uint sequence;
    c_ulong signal;
}

struct drm_wait_vblank_reply {
    enum drm_vblank_seq_type {
        _DRM_VBLANK_ABSOLUTE = 0,
        _DRM_VBLANK_RELATIVE = 1,
        _DRM_VBLANK_EVENT = 67108864,
        _DRM_VBLANK_FLIP = 134217728,
        _DRM_VBLANK_NEXTONMISS = 268435456,
        _DRM_VBLANK_SECONDARY = 536870912,
        _DRM_VBLANK_SIGNAL = 1073741824
    }
    drm_vblank_seq_type type;
    uint sequence;
    c_long tval_sec;
    c_long tval_usec;
}

struct drm_modeset_ctl {
    uint crtc;
    uint cmd;
}

struct drm_agp_mode {
    c_ulong mode;
}

struct drm_agp_buffer {
    c_ulong size;
    c_ulong handle;
    c_ulong type;
    c_ulong physical;
}

struct drm_agp_binding {
    c_ulong handle;
    c_ulong offset;
}

struct drm_agp_info {
    int agp_version_major;
    int agp_version_minor;
    c_ulong mode;
    c_ulong aperture_base;
    c_ulong aperture_size;
    c_ulong memory_allowed;
    c_ulong memory_used;
    ushort id_vendor;
    ushort id_device;
}

struct drm_scatter_gather {
    c_ulong size;
    c_ulong handle;
}

struct drm_set_version {
    int drm_di_major;
    int drm_di_minor;
    int drm_dd_major;
    int drm_dd_minor;
}

struct drm_gem_close {
    uint handle;
    uint pad;
}

struct drm_gem_flink {
    uint handle;
    uint name;
}

struct drm_gem_open {
    uint name;
    uint handle;
    ulong size;
}

struct drm_get_cap {
    ulong capability;
    ulong value;
}

struct drm_set_client_cap {
    ulong capability;
    ulong value;
}

struct drm_prime_handle {
    uint handle;
    uint flags;
    int fd;
}

struct drm_event {
    uint type;
    uint length;
}

struct drm_event_vblank {
    drm_event base;
    ulong user_data;
    uint tv_sec;
    uint tv_usec;
    uint sequence;
    uint reserved;
}

union drm_wait_vblank {
    struct drm_wait_vblank_request {
        enum drm_vblank_seq_type {
            _DRM_VBLANK_ABSOLUTE = 0,
            _DRM_VBLANK_RELATIVE = 1,
            _DRM_VBLANK_EVENT = 67108864,
            _DRM_VBLANK_FLIP = 134217728,
            _DRM_VBLANK_NEXTONMISS = 268435456,
            _DRM_VBLANK_SECONDARY = 536870912,
            _DRM_VBLANK_SIGNAL = 1073741824
        }
        drm_vblank_seq_type type;
        uint sequence;
        c_ulong signal;
    }
    drm_wait_vblank_request request;
    struct drm_wait_vblank_reply {
        enum drm_vblank_seq_type {
            _DRM_VBLANK_ABSOLUTE = 0,
            _DRM_VBLANK_RELATIVE = 1,
            _DRM_VBLANK_EVENT = 67108864,
            _DRM_VBLANK_FLIP = 134217728,
            _DRM_VBLANK_NEXTONMISS = 268435456,
            _DRM_VBLANK_SECONDARY = 536870912,
            _DRM_VBLANK_SIGNAL = 1073741824
        }
        drm_vblank_seq_type type;
        uint sequence;
        c_long tval_sec;
        c_long tval_usec;
    }
    drm_wait_vblank_reply reply;
}