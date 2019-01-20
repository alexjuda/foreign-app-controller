import Foundation
import Carbon

struct KeyboardEffector: KeyboardProvider {
    let keyToCode: [KeyStroke.Key: Int] = [
        .key0: kVK_ANSI_0,
        .key1: kVK_ANSI_1,
        .key2: kVK_ANSI_2,
        .key3: kVK_ANSI_3,
        .key4: kVK_ANSI_4,
        .key5: kVK_ANSI_5,
        .key6: kVK_ANSI_6,
        .key7: kVK_ANSI_7,
        .key8: kVK_ANSI_8,
        .key9: kVK_ANSI_9,
        .minus: kVK_ANSI_Minus,
        .equals: kVK_ANSI_Equal,
        
        .i: kVK_ANSI_I,
        .arrowUp: kVK_UpArrow,
        .arrowDown: kVK_DownArrow,
        .arrowLeft: kVK_LeftArrow,
        .arrowRight: kVK_RightArrow
    ]
    let modifierToCode: [KeyStroke.Modifier: Int] = [
        .option: kVK_Option,
        .shift: kVK_Shift,
        .control: kVK_Control
    ]
    
    let pid: pid_t
    
    func press(request: KeyStroke, session: KeyboardPressSession) throws -> KeyboardResponse {
        if let keyCode = modifierToCode[request.modifier] {
            let event = CGEvent(keyboardEventSource: nil, virtualKey: UInt16(keyCode), keyDown: true)!
            event.postToPid(pid)
        }
        
        if let modifierCode = keyToCode[request.key] {
            let event = CGEvent(keyboardEventSource: nil, virtualKey: UInt16(modifierCode), keyDown: true)!
            event.postToPid(pid)
        }
        
        return KeyboardResponse()
    }
    
    func release(request: KeyStroke, session: KeyboardReleaseSession) throws -> KeyboardResponse {
        if let keyCode = modifierToCode[request.modifier] {
            let event = CGEvent(keyboardEventSource: nil, virtualKey: UInt16(keyCode), keyDown: false)!
            event.postToPid(pid)
        }
        
        if let modifierCode = keyToCode[request.key] {
            let event = CGEvent(keyboardEventSource: nil, virtualKey: UInt16(modifierCode), keyDown: false)!
            event.postToPid(pid)
        }
        
        return KeyboardResponse()
    }
}
