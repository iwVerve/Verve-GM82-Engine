///cement_blocks()

// Stitches together Block instances into fewer, larger, instances for performance optimization.

var _coll;

repeat(global.optimize_solids) {
    with(Block) {
        if object_index != Block {
            continue;
        }
        coll = instance_place(x + 1, y, Block);
        if coll if
                bbox_right < coll.bbox_left &&
                sign(image_xscale) == sign(coll.image_xscale) &&
                y == coll.y &&
                image_yscale == coll.image_yscale &&
                coll.object_index = Block {
            image_xscale += coll.image_xscale;
            instance_destroy_id(coll);
        }
    }
    with(Block) {
        if object_index != Block {
            continue;
        }
        coll = instance_place(x, y + 1, Block);
        if coll if
                bbox_bottom < coll.bbox_top &&
                sign(image_yscale) == sign(coll.image_yscale) &&
                x == coll.x &&
                image_xscale == coll.image_xscale &&
                coll.object_index == Block {
            image_yscale += coll.image_yscale;
            instance_destroy_id(coll);
        }
    }
}
