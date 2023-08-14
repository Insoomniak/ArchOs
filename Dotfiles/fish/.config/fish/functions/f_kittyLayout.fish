# fish function to setup kitty layout
function f_kittyLayout
    kitty @ new-window
    kitty @ new-window
    kitty @ new-window
    kitty @ resize-window --increment -10 --axis vertical
end
