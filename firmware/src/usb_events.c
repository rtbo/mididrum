
#include "drum_kit.h"
#include "timer.h"
#include "io.h"

#include "usb_device.h"
#include "usb_device_midi.h"

bool USER_USB_CALLBACK_EVENT_HANDLER(USB_EVENT event, void *data, uint16_t size)
{
    switch ((int) event) {
    case EVENT_TRANSFER:
        break;

    case EVENT_SOF:
        break;

    case EVENT_SUSPEND:
        DrumKit_Suspend();
        break;

    case EVENT_RESUME:
        DrumKit_Resume();
        break;

    case EVENT_CONFIGURED:
        DrumKit_Activate();
        break;

    case EVENT_SET_DESCRIPTOR:
        break;

    case EVENT_EP0_REQUEST:
        break;

    case EVENT_BUS_ERROR:
        break;

    case EVENT_TRANSFER_TERMINATED:
        break;

    default:
        break;
    }
    return true;
}

/*******************************************************************************
 End of File
 */
