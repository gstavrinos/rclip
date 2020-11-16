<img src="https://raw.githubusercontent.com/gstavrinos/rclip/master/rclip.png">

# rclip
Replace clipboard text and paste the result! 

## Motivation
I have had enough forgetting to change the keyboard input language before starting typing.

I needed a quick way to have e.g. `υοθυθβε.ψομ` become `youtube.com`.

### Example
1. Copied text: `x;artew γοογλε`
2. Ran script with `julia rclip.jl configs/en_el.txt`
3. Pasted text: `χάρτες gοοgle`

### How to use it
Bind a keyboard shortcut to the script with the available Greek-to-English and vice-versa config or your custom one.

Based on your setup this can vary greatly.

With the script binded successfully, let's say to `Super+v`, you can `Ctrl+c` the text you want to be rclip'd, then press `Super+v` and finally `Ctrl+v` to paste the corrected text.

### Dependencies
xclip (for Debian-based systems sudo apt install xclip)

