draw_self();

if (dragging)
{
    draw_set_color(c_red);
    draw_line(x, y, mouse_x, mouse_y);
}