# ZFS mirror failing with PANIC and kernel module crash.

This is still unsolved...

```
[  450.937402] VERIFY3S(err, ==, ENOENT) failed (52 == 2)                                               
[  450.937429] PANIC at dsl_dataset.c:4912:dsl_dataset_get_remap_deadlist_object()                      
[  450.937444] Showing stack for process 2500                                                           
[  450.937455] CPU: 1 UID: 0 PID: 2500 Comm: zpool Tainted: P S         O        6.17.2-1-pve #1 PREEMPT
(voluntary)                                                                                             
[  450.937460] Tainted: [P]=PROPRIETARY_MODULE, [S]=CPU_OUT_OF_SPEC, [O]=OOT_MODULE                     
[  450.937461] Hardware name: HP ProLiant MicroServer Gen8, BIOS J06 11/02/2015                         
[  450.937463] Call Trace:                                                                              
[  450.937466]  <TASK>                                                                                  
[  450.937469]  dump_stack_lvl+0x5f/0x90
[  450.937478]  dump_stack+0x10/0x18
[  450.937481]  spl_dumpstack+0x28/0x40 [spl]
[  450.937496]  spl_panic+0xef/0x114 [spl]
[  450.937511]  ? zap_lookup+0x56/0x130 [zfs]
[  450.937830]  dsl_dataset_get_remap_deadlist_object+0xe2/0xf0 [zfs]
[  450.938145]  dsl_dataset_hold_obj+0x87a/0xa80 [zfs]
[  450.938433]  traverse_pool+0x156/0x200 [zfs]
[  450.938741]  ? __pfx_spa_load_verify_cb+0x10/0x10 [zfs]
[  450.939044]  spa_load+0xe97/0x1a90 [zfs]
[  450.939327]  spa_load_best+0x57/0x2e0 [zfs]
[  450.939602]  ? zpool_get_load_policy+0x19c/0x1b0 [zfs]
[  450.939862]  spa_import+0x22a/0x6c0 [zfs]
[  450.940144]  zfs_ioc_pool_import+0x153/0x170 [zfs]
[  450.940398]  zfsdev_ioctl_common+0x7c2/0x970 [zfs]
[  450.940650]  zfsdev_ioctl+0x57/0xf0 [zfs]
[  450.940882]  __x64_sys_ioctl+0xa5/0x100
[  450.940887]  ? ___pte_offset_map+0x1c/0x180
[  450.940892]  x64_sys_call+0x1151/0x2330
[  450.940896]  do_syscall_64+0x80/0xa30
[  450.940901]  ? count_memcg_events+0xd7/0x1a0
[  450.940906]  ? handle_mm_fault+0x254/0x370
[  450.940911]  ? do_user_addr_fault+0x2f8/0x830
[  450.940915]  ? irqentry_exit_to_user_mode+0x2e/0x290
[  450.940919]  ? irqentry_exit+0x43/0x50
[  450.940922]  ? exc_page_fault+0x90/0x1b0
[  450.940926]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  450.940928] RIP: 0033:0x7ed58b24691b
[  450.940932] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44
 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28
 00 00
[  450.940935] RSP: 002b:00007ffc2aae98b0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[  450.940938] RAX: ffffffffffffffda RBX: 000063c0f7bd2960 RCX: 00007ed58b24691b
[  450.940940] RDX: 00007ffc2aae9970 RSI: 0000000000005a02 RDI: 0000000000000003
[  450.940942] RBP: 00007ffc2aaee060 R08: 00007ed58b31fac0 R09: 0000000000000001
[  450.940943] R10: 00007ed58b31ff50 R11: 0000000000000246 R12: 000063c0f7bd02c0
[  450.940944] R13: 00007ffc2aae9970 R14: 00007ed57c001ae8 R15: 000063c0f7bec960
[  450.940948]  </TASK>
```

# Extract index

`zdb -e -p /dev/sdc1 -A ArkThis8T 2>&1 | tee /root/ArkThis8T-zdb.log`


# Links

Related thread: https://forum.proxmox.com/threads/zfs-panic-dsl_dataset_get_remap_deadlist_object.185911/
