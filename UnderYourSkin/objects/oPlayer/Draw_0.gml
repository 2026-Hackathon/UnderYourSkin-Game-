draw_self();
// **EXACT drag line: start pos → current mouse pos**
if (dragging)
{
    draw_set_color(c_red);
    draw_line(drag_start_x, drag_start_y, mouse_x, mouse_y);
}
