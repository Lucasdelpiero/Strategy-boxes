mbLeftPressed = mouse_check_button_pressed(mb_left);
mbLeft = mouse_check_button(mb_left);
mbRight = mouse_check_button(mb_right);
mbRightPressed = mouse_check_button_pressed(mb_right);
mbRightReleased = mouse_check_button_released(mb_right)
controlKey = keyboard_check(vk_control);
left = max(keyboard_check(ord("A")), keyboard_check(vk_left), 0);
right = max(keyboard_check(ord("D")) , keyboard_check(vk_right), 0);
up = max(keyboard_check(ord("W")) , keyboard_check(vk_up), 0);
down = max(keyboard_check(ord("S")) , keyboard_check(vk_down), 0);
wheelUp = mouse_wheel_up();
wheelDown = mouse_wheel_down();
cameraLeft = keyboard_check(ord("Q"));
cameraRight = keyboard_check(ord("E"));
groupKey = keyboard_check_pressed(ord("G"));
groupOrderKey = groupKey = keyboard_check(ord("G"));

//Numbers
key_1 = keyboard_check(ord("1"));
key_2 = keyboard_check(ord("2"));
key_3 = keyboard_check(ord("3"));
key_4 = keyboard_check(ord("4"));
key_5 = keyboard_check(ord("5"));
key_6 = keyboard_check(ord("6"));
key_7 = keyboard_check(ord("7"));
key_8 = keyboard_check(ord("8"));
key_9 = keyboard_check(ord("9"));
key_0 = keyboard_check(ord("0"));

//Speed
speedUp = keyboard_check_pressed(ord("V"));
speedDown = keyboard_check_pressed(ord("C"));
