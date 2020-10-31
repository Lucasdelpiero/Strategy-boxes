//Selector
var selector;
if mbLeftPressed {
    selector = instance_create(x,y,obj_selector);
}
if mbLeft{
    obj_selector.image_xscale = dcos(view_angle) * (x - obj_selector.x) + dsin(view_angle) * (y - obj_selector.y) ; 
    obj_selector.image_yscale = dcos(view_angle) * (y - obj_selector.y) + -dsin(view_angle) * (x - obj_selector.x)  ;
    obj_selector.image_angle = -view_angle;
} else if instance_exists(obj_selector){
    with(obj_selector) {
        instance_destroy();
    }
}