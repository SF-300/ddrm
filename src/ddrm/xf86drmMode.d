module ddrm.xf86drmMode;

import core.stdc.config;
import ddrm.drm : drm_mode_property_enum;

extern (C):

enum drmModeConnection {
    DRM_MODE_CONNECTED = 1,
    DRM_MODE_DISCONNECTED = 2,
    DRM_MODE_UNKNOWNCONNECTION = 3
}

enum drmModeSubPixel {
    DRM_MODE_SUBPIXEL_UNKNOWN = 1,
    DRM_MODE_SUBPIXEL_HORIZONTAL_RGB = 2,
    DRM_MODE_SUBPIXEL_HORIZONTAL_BGR = 3,
    DRM_MODE_SUBPIXEL_VERTICAL_RGB = 4,
    DRM_MODE_SUBPIXEL_VERTICAL_BGR = 5,
    DRM_MODE_SUBPIXEL_NONE = 6
}

alias drmModeClipPtr = drmModeClip*;
struct drmModeClip;

alias drmModeResPtr = drmModeRes*;
struct drmModeRes {
    int count_fbs;
    uint* fbs;
    int count_crtcs;
    uint* crtcs;
    int count_connectors;
    uint* connectors;
    int count_encoders;
    uint* encoders;
    uint min_width;
    uint max_width;
    uint min_height;
    uint max_height;
}

alias drmModeModeInfoPtr = drmModeModeInfo*;
struct drmModeModeInfo {
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

alias drmModeFBPtr = drmModeFB*;
struct drmModeFB {
    uint fb_id;
    uint width;
    uint height;
    uint pitch;
    uint bpp;
    uint depth;
    uint handle;
}

alias drmModePropertyBlobPtr = drmModePropertyBlob*;
struct drmModePropertyBlob {
    uint id;
    uint length;
    void* data;
}

alias drmModePropertyPtr = drmModeProperty*;
struct drmModeProperty {
    uint prop_id;
    uint flags;
    char[32] name;
    int count_values;
    ulong* values;
    int count_enums;
    drm_mode_property_enum* enums;
    int count_blobs;
    uint* blob_ids;
}

alias drmModeCrtcPtr = drmModeCrtc*;
struct drmModeCrtc {
    uint crtc_id;
    uint buffer_id;
    uint x;
    uint y;
    uint width;
    uint height;
    int mode_valid;
    drmModeModeInfo mode;
    int gamma_size;
}

alias drmModeEncoderPtr = drmModeEncoder*;
struct drmModeEncoder {
    uint encoder_id;
    uint encoder_type;
    uint crtc_id;
    uint possible_crtcs;
    uint possible_clones;
}

alias drmModeConnectorPtr = drmModeConnector*;
struct drmModeConnector {
    uint connector_id;
    uint encoder_id;
    uint connector_type;
    uint connector_type_id;
    drmModeConnection connection;
    uint mmWidth;
    uint mmHeight;
    drmModeSubPixel subpixel;
    int count_modes;
    drmModeModeInfoPtr modes;
    int count_props;
    uint* props;
    ulong* prop_values;
    int count_encoders;
    uint* encoders;
}

alias drmModeObjectPropertiesPtr = drmModeObjectProperties*;
struct drmModeObjectProperties {
    uint count_props;
    uint* props;
    ulong* prop_values;
}

alias drmModePlanePtr = drmModePlane*;
struct drmModePlane {
    uint count_formats;
    uint* formats;
    uint plane_id;
    uint crtc_id;
    uint fb_id;
    uint crtc_x;
    uint crtc_y;
    uint x;
    uint y;
    uint possible_crtcs;
    uint gamma_size;
}

alias drmModePlaneResPtr = drmModePlaneRes*;
struct drmModePlaneRes {
    uint count_planes;
    uint* planes;
}


void drmModeFreeModeInfo (drmModeModeInfoPtr ptr);
void drmModeFreeResources (drmModeResPtr ptr);
void drmModeFreeFB (drmModeFBPtr ptr);
void drmModeFreeCrtc (drmModeCrtcPtr ptr);
void drmModeFreeConnector (drmModeConnectorPtr ptr);
void drmModeFreeEncoder (drmModeEncoderPtr ptr);
void drmModeFreePlane (drmModePlanePtr ptr);
void drmModeFreePlaneResources (drmModePlaneResPtr ptr);
drmModeResPtr drmModeGetResources (int fd);
drmModeFBPtr drmModeGetFB (int fd, uint bufferId);
int drmModeAddFB (int fd, uint width, uint height, ubyte depth, ubyte bpp, uint pitch, uint bo_handle, uint* buf_id);
int drmModeAddFB2 (int fd, uint width, uint height, uint pixel_format, uint[4] bo_handles, uint[4] pitches, uint[4] offsets, uint* buf_id, uint flags);
int drmModeRmFB (int fd, uint bufferId);
int drmModeDirtyFB (int fd, uint bufferId, drmModeClipPtr clips, uint num_clips);
drmModeCrtcPtr drmModeGetCrtc (int fd, uint crtcId);
int drmModeSetCrtc (int fd, uint crtcId, uint bufferId, uint x, uint y, uint* connectors, int count, drmModeModeInfoPtr mode);
int drmModeSetCursor (int fd, uint crtcId, uint bo_handle, uint width, uint height);
int drmModeSetCursor2 (int fd, uint crtcId, uint bo_handle, uint width, uint height, int hot_x, int hot_y);
int drmModeMoveCursor (int fd, uint crtcId, int x, int y);
drmModeEncoderPtr drmModeGetEncoder (int fd, uint encoder_id);
drmModeConnectorPtr drmModeGetConnector (int fd, uint connectorId);
int drmModeAttachMode (int fd, uint connectorId, drmModeModeInfoPtr mode_info);
int drmModeDetachMode (int fd, uint connectorId, drmModeModeInfoPtr mode_info);
drmModePropertyPtr drmModeGetProperty (int fd, uint propertyId);
void drmModeFreeProperty (drmModePropertyPtr ptr);
drmModePropertyBlobPtr drmModeGetPropertyBlob (int fd, uint blob_id);
void drmModeFreePropertyBlob (drmModePropertyBlobPtr ptr);
int drmModeConnectorSetProperty (int fd, uint connector_id, uint property_id, ulong value);
int drmCheckModesettingSupported (const(char)* busid);
int drmModeCrtcSetGamma (int fd, uint crtc_id, uint size, ushort* red, ushort* green, ushort* blue);
int drmModeCrtcGetGamma (int fd, uint crtc_id, uint size, ushort* red, ushort* green, ushort* blue);
int drmModePageFlip (int fd, uint crtc_id, uint fb_id, uint flags, void* user_data);
drmModePlaneResPtr drmModeGetPlaneResources (int fd);
drmModePlanePtr drmModeGetPlane (int fd, uint plane_id);
int drmModeSetPlane (int fd, uint plane_id, uint crtc_id, uint fb_id, uint flags, int crtc_x, int crtc_y, uint crtc_w, uint crtc_h, uint src_x, uint src_y, uint src_w, uint src_h);
drmModeObjectPropertiesPtr drmModeObjectGetProperties (int fd, uint object_id, uint object_type);
void drmModeFreeObjectProperties (drmModeObjectPropertiesPtr ptr);
int drmModeObjectSetProperty (int fd, uint object_id, uint object_type, uint property_id, ulong value);