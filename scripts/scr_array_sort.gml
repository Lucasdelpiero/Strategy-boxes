/// scr_array_sort(array , variable)
{
var array = argument0;
var variable = argument1;

for(i = 0; i < array_length_1d(array) - 1 ; i++) {
    if( array[i].variable > array[i + 1].variable) {
        var up = array[i + 1];
        var down = array[i];
        array[i] = up;
        array[i + 1] = down;
        i = -1;
    }
}

return array;
}