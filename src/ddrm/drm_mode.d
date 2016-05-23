module ddrm.drm_mode;


extern (C):

enum {
	DRM_DISPLAY_INFO_LEN = 32,
	DRM_CONNECTOR_NAME_LEN = 32,
	DRM_DISPLAY_MODE_LEN = 32,
	DRM_PROP_NAME_LEN = 32
}

enum {
	DRM_MODE_TYPE_BUILTIN = (1<<0),
	DRM_MODE_TYPE_CLOCK_C = ((1<<1) | DRM_MODE_TYPE_BUILTIN),
	DRM_MODE_TYPE_CRTC_C = ((1<<2) | DRM_MODE_TYPE_BUILTIN),
	DRM_MODE_TYPE_PREFERRED = (1<<3),
	DRM_MODE_TYPE_DEFAULT = (1<<4),
	DRM_MODE_TYPE_USERDEF = (1<<5),
	DRM_MODE_TYPE_DRIVER = (1<<6)
}


enum {
	DRM_MODE_FLAG_PHSYNC = (1<<0),
	DRM_MODE_FLAG_NHSYNC = (1<<1),
	DRM_MODE_FLAG_PVSYNC = (1<<2),
	DRM_MODE_FLAG_NVSYNC = (1<<3),
	DRM_MODE_FLAG_INTERLACE = (1<<4),
	DRM_MODE_FLAG_DBLSCAN = (1<<5),
	DRM_MODE_FLAG_CSYNC = (1<<6),
	DRM_MODE_FLAG_PCSYNC = (1<<7),
	DRM_MODE_FLAG_NCSYNC = (1<<8),
	DRM_MODE_FLAG_HSKEW = (1<<9),
	DRM_MODE_FLAG_BCAST = (1<<10),
	DRM_MODE_FLAG_PIXMUX = (1<<11),
	DRM_MODE_FLAG_DBLCLK = (1<<12),
	DRM_MODE_FLAG_CLKDIV2 = (1<<13),
	DRM_MODE_FLAG_3D_MASK = (0x1f<<14),
	DRM_MODE_FLAG_3D_NONE = (0<<14),
	DRM_MODE_FLAG_3D_FRAME_PACKING = (1<<14),
	DRM_MODE_FLAG_3D_FIELD_ALTERNATIVE = (2<<14),
	DRM_MODE_FLAG_3D_LINE_ALTERNATIVE = (3<<14),
	DRM_MODE_FLAG_3D_SIDE_BY_SIDE_FULL = (4<<14),
	DRM_MODE_FLAG_3D_L_DEPTH = (5<<14),
	DRM_MODE_FLAG_3D_L_DEPTH_GFX_GFX_DEPTH = (6<<14),
	DRM_MODE_FLAG_3D_TOP_AND_BOTTOM = (7<<14),
	DRM_MODE_FLAG_3D_SIDE_BY_SIDE_HALF = (8<<14)
}

enum {
	DRM_MODE_DPMS_ON = 0,
	DRM_MODE_DPMS_STANDBY = 1,
	DRM_MODE_DPMS_SUSPEND = 2,
	DRM_MODE_DPMS_OFF = 3
}

enum {
	DRM_MODE_SCALE_NONE = 0,
	DRM_MODE_SCALE_FULLSCREEN = 1,
	DRM_MODE_SCALE_CENTER = 2,
	DRM_MODE_SCALE_ASPECT = 3
}

enum {
	DRM_MODE_DITHERING_OFF = 0,
	DRM_MODE_DITHERING_ON = 1,
	DRM_MODE_DITHERING_AUTO = 2
}

enum {
	DRM_MODE_DIRTY_OFF = 0,
	DRM_MODE_DIRTY_ON = 1,
	DRM_MODE_DIRTY_ANNOTATE = 2
}

enum {
	DRM_MODE_PRESENT_TOP_FIELD = (1<<0),
	DRM_MODE_PRESENT_BOTTOM_FIELD = (1<<1)
}

enum {
	DRM_MODE_ENCODER_NONE = 0,
	DRM_MODE_ENCODER_DAC = 1,
	DRM_MODE_ENCODER_TMDS = 2,
	DRM_MODE_ENCODER_LVDS = 3,
	DRM_MODE_ENCODER_TVDAC = 4
}

enum {
	DRM_MODE_SUBCONNECTOR_Automatic = 0,
	DRM_MODE_SUBCONNECTOR_Unknown = 0,
	DRM_MODE_SUBCONNECTOR_DVID = 3,
	DRM_MODE_SUBCONNECTOR_DVIA = 4,
	DRM_MODE_SUBCONNECTOR_Composite = 5,
	DRM_MODE_SUBCONNECTOR_SVIDEO = 6,
	DRM_MODE_SUBCONNECTOR_Component = 8,
	DRM_MODE_SUBCONNECTOR_SCART = 9
}

enum {
	DRM_MODE_CONNECTOR_Unknown = 0,
	DRM_MODE_CONNECTOR_VGA = 1,
	DRM_MODE_CONNECTOR_DVII = 2,
	DRM_MODE_CONNECTOR_DVID = 3,
	DRM_MODE_CONNECTOR_DVIA = 4,
	DRM_MODE_CONNECTOR_Composite = 5,
	DRM_MODE_CONNECTOR_SVIDEO = 6,
	DRM_MODE_CONNECTOR_LVDS = 7,
	DRM_MODE_CONNECTOR_Component = 8,
	DRM_MODE_CONNECTOR_9PinDIN = 9,
	DRM_MODE_CONNECTOR_DisplayPort = 10,
	DRM_MODE_CONNECTOR_HDMIA = 11,
	DRM_MODE_CONNECTOR_HDMIB = 12,
	DRM_MODE_CONNECTOR_TV = 13,
	DRM_MODE_CONNECTOR_eDP = 14
}

enum {
	DRM_MODE_PROP_PENDING = (1<<0),
	DRM_MODE_PROP_RANGE = (1<<1),
	DRM_MODE_PROP_IMMUTABLE = (1<<2),
	DRM_MODE_PROP_ENUM = (1<<3),
	DRM_MODE_PROP_BLOB = (1<<4),
	DRM_MODE_PROP_BITMASK = (1<<5)
}

enum {
	DRM_MODE_OBJECT_CRTC = 0xcccccccc,
	DRM_MODE_OBJECT_CONNECTOR = 0xc0c0c0c0,
	DRM_MODE_OBJECT_ENCODER = 0xe0e0e0e0,
	DRM_MODE_OBJECT_MODE = 0xdededede,
	DRM_MODE_OBJECT_PROPERTY = 0xb0b0b0b0,
	DRM_MODE_OBJECT_FB = 0xfbfbfbfb,
	DRM_MODE_OBJECT_BLOB = 0xbbbbbbbb,
	DRM_MODE_OBJECT_PLANE = 0xeeeeeeee
}

enum DRM_MODE_FB_INTERLACED = (1<<0);

enum {
	DRM_MODE_FB_DIRTY_ANNOTATE_COPY = 0x01,
	DRM_MODE_FB_DIRTY_ANNOTATE_FILL = 0x02,
	DRM_MODE_FB_DIRTY_FLAGS = 0x03
}

enum {
	DRM_MODE_CURSOR_BO = (1<<0),
	DRM_MODE_CURSOR_MOVE = (1<<1)
}

enum {
	DRM_MODE_PAGE_FLIP_EVENT = 0x01,
	DRM_MODE_PAGE_FLIP_ASYNC = 0x02,
	DRM_MODE_PAGE_FLIP_FLAGS = (DRM_MODE_PAGE_FLIP_EVENT|DRM_MODE_PAGE_FLIP_ASYNC)
}

struct drm_mode_modeinfo {
    uint clock;
    ushort hdisplay;
    ushort hsync_start;
    ushort hsync_end;
    ushort htotal;
    ushort hskew;
    ushort vdisplay;
    ushort vsync_start;
    ushort vsync_end;
    ushort vtotal;
    ushort vscan;
    uint vrefresh;
    uint flags;
    uint type;
    char[32] name;
}

struct drm_mode_card_res {
    ulong fb_id_ptr;
    ulong crtc_id_ptr;
    ulong connector_id_ptr;
    ulong encoder_id_ptr;
    uint count_fbs;
    uint count_crtcs;
    uint count_connectors;
    uint count_encoders;
    uint min_width;
    uint max_width;
    uint min_height;
    uint max_height;
}

struct drm_mode_crtc {
    ulong set_connectors_ptr;
    uint count_connectors;
    uint crtc_id;
    uint fb_id;
    uint x;
    uint y;
    uint gamma_size;
    uint mode_valid;
    drm_mode_modeinfo mode;
}

struct drm_mode_set_plane {
    uint plane_id;
    uint crtc_id;
    uint fb_id;
    uint flags;
    int crtc_x;
    int crtc_y;
    uint crtc_w;
    uint crtc_h;
    uint src_x;
    uint src_y;
    uint src_h;
    uint src_w;
}

struct drm_mode_get_plane {
    uint plane_id;
    uint crtc_id;
    uint fb_id;
    uint possible_crtcs;
    uint gamma_size;
    uint count_format_types;
    ulong format_type_ptr;
}

struct drm_mode_get_plane_res {
    ulong plane_id_ptr;
    uint count_planes;
}

struct drm_mode_get_encoder {
    uint encoder_id;
    uint encoder_type;
    uint crtc_id;
    uint possible_crtcs;
    uint possible_clones;
}

struct drm_mode_get_connector {
    ulong encoders_ptr;
    ulong modes_ptr;
    ulong props_ptr;
    ulong prop_values_ptr;
    uint count_modes;
    uint count_props;
    uint count_encoders;
    uint encoder_id;
    uint connector_id;
    uint connector_type;
    uint connector_type_id;
    uint connection;
    uint mm_width;
    uint mm_height;
    uint subpixel;
}

struct drm_mode_property_enum {
    ulong value;
    char[32] name;
}

struct drm_mode_get_property {
    ulong values_ptr;
    ulong enum_blob_ptr;
    uint prop_id;
    uint flags;
    char[32] name;
    uint count_values;
    uint count_enum_blobs;
}

struct drm_mode_connector_set_property {
    ulong value;
    uint prop_id;
    uint connector_id;
}

struct drm_mode_obj_get_properties {
    ulong props_ptr;
    ulong prop_values_ptr;
    uint count_props;
    uint obj_id;
    uint obj_type;
}

struct drm_mode_obj_set_property {
    ulong value;
    uint prop_id;
    uint obj_id;
    uint obj_type;
}

struct drm_mode_get_blob {
    uint blob_id;
    uint length;
    ulong data;
}

struct drm_mode_fb_cmd {
    uint fb_id;
    uint width;
    uint height;
    uint pitch;
    uint bpp;
    uint depth;
    uint handle;
}

struct drm_mode_fb_cmd2 {
    uint fb_id;
    uint width;
    uint height;
    uint pixel_format;
    uint flags;
    uint[4] handles;
    uint[4] pitches;
    uint[4] offsets;
}

struct drm_mode_fb_dirty_cmd {
    uint fb_id;
    uint flags;
    uint color;
    uint num_clips;
    ulong clips_ptr;
}

struct drm_mode_mode_cmd {
    uint connector_id;
    drm_mode_modeinfo mode;
}

struct drm_mode_cursor {
    uint flags;
    uint crtc_id;
    int x;
    int y;
    uint width;
    uint height;
    uint handle;
}

struct drm_mode_cursor2 {
    uint flags;
    uint crtc_id;
    int x;
    int y;
    uint width;
    uint height;
    uint handle;
    int hot_x;
    int hot_y;
}

struct drm_mode_crtc_lut {
    uint crtc_id;
    uint gamma_size;
    ulong red;
    ulong green;
    ulong blue;
}

struct drm_mode_crtc_page_flip {
    uint crtc_id;
    uint fb_id;
    uint flags;
    uint reserved;
    ulong user_data;
}

struct drm_mode_create_dumb {
    uint height;
    uint width;
    uint bpp;
    uint flags;
    uint handle;
    uint pitch;
    ulong size;
}

struct drm_mode_map_dumb {
    uint handle;
    uint pad;
    ulong offset;
}

struct drm_mode_destroy_dumb {
    uint handle;
}