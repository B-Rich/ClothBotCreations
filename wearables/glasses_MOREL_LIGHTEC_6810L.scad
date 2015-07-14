// Replace arms for glasses
// Make: MOREL
// Model: LIGHTEC 6810L
// Parameters: 52[]17  140 GB 205

glasses_arm_outline_start_pt=[0,0];
glasses_arm_outline_end_pt=[3.0,10.37];
glasses_arm_outline=[glasses_arm_outline_start_pt
    ,[83.0,0],[80.0,5.0]
    ,[55.86,5.0],[48.81,10.37]
    ,glasses_arm_outline_end_pt];
glasses_arm_inline=[glasses_arm_outline_start_pt
    ,[83.0,0],[83.0-(3.1*(83.0-80.0)/5.00),3.1]
    ,[34.30,3.1],[26.81,10.37]
    ,glasses_arm_outline_end_pt];
glasses_arm_mount_hole_w=0.9;
glasses_arm_mount_hole_l=3.82;
glasses_arm_mount_hole_offset=(glasses_arm_outline_end_pt-glasses_arm_outline_start_pt)/2+[2.27,0];
glasses_arm_mount_hole=[
    glasses_arm_mount_hole_offset+[0,-glasses_arm_mount_hole_w/2]
    ,glasses_arm_mount_hole_offset+[0,glasses_arm_mount_hole_w/2]
    ,glasses_arm_mount_hole_offset+[glasses_arm_mount_hole_l,glasses_arm_mount_hole_w/2]
    ,glasses_arm_mount_hole_offset+[glasses_arm_mount_hole_l,-glasses_arm_mount_hole_w/2]
];
glasses_arm_mount_slot_w=4.82;
glasses_arm_mount_slot_l=13.64;
glasses_arm_mount_slot_dy=[0,1]*glasses_arm_mount_hole_offset;
glasses_arm_mount_slot_th=0.84;
glasses_arm_mount_slot=[
    [0,glasses_arm_mount_slot_dy-glasses_arm_mount_slot_w/2]
    ,[glasses_arm_mount_slot_l,glasses_arm_mount_slot_dy-glasses_arm_mount_slot_w/2]
    ,[glasses_arm_mount_slot_l,glasses_arm_mount_slot_dy+glasses_arm_mount_slot_w/2]
    ,[0,glasses_arm_mount_slot_dy+glasses_arm_mount_slot_w/2]
];    
glasses_arm_outline_th=2.10;
glasses_arm_inline_th=2.60;
glasses_arm_inner_th=1.60;

glasses_ear_outline_extend=[3.0,0];
glasses_ear_outline_start_pt=[83.0,0];
glasses_ear_outline_outer_elbow_pt=[134.0-32*3/4,0];
glasses_ear_outline_inner_elbow_pt=[130-30.0*3/4,5.0];
glasses_ear_outline_end_pt=[80.0,5.0];
glasses_ear_outline=[glasses_ear_outline_start_pt-glasses_ear_outline_extend
    ,glasses_ear_outline_outer_elbow_pt
    ,[134.0,32.0],[130,35.0]
    ,glasses_ear_outline_inner_elbow_pt
    ,glasses_ear_outline_end_pt-glasses_ear_outline_extend];
glasses_ear_inline_inset=[1.0,0];
glasses_ear_inline=[[83.0,0]+glasses_ear_inline_inset
    ,glasses_ear_outline_outer_elbow_pt
    ,[134.0-(32-24)*3/4,24.0],[130-(32-24)*3/4,24.0]
//    ,[130-24.0*3/4-5*3/4,3.0]
    ,glasses_ear_outline_outer_elbow_pt-(glasses_ear_outline_outer_elbow_pt-glasses_ear_outline_inner_elbow_pt)*3/5
//    ,[83.0-3*3/5,3.0]
    ,glasses_ear_outline_start_pt-(glasses_ear_outline_start_pt-glasses_ear_outline_end_pt)*3/5+glasses_ear_inline_inset
    ];
glasses_ear_outline_th=2.00;
glasses_ear_inline_th=2.50;

module glasses_arm() {
    difference() {
        difference() {
            union() {
                linear_extrude(glasses_arm_outline_th) polygon(glasses_arm_outline,convexity=10);
                linear_extrude(glasses_arm_inline_th) polygon(glasses_arm_inline,convexity=10);
            }
            linear_extrude(2*glasses_arm_mount_slot_th,center=true) polygon(glasses_arm_mount_slot,convexity=10);
        }
        linear_extrude(4*glasses_arm_inline_th,center=true) polygon(glasses_arm_mount_hole,convexity=10);
    }
}

module glasses_ear() {
    linear_extrude(glasses_ear_outline_th) polygon(glasses_ear_outline,convexity=10);
    linear_extrude(glasses_ear_inline_th) polygon(glasses_ear_inline,convexity=10);
}

glasses_arm();
glasses_ear();
