require 'ffi'
require "ffi-procps/version"

module Procps
  module LibProc
    extend FFI::Library
    ffi_lib("libproc")


    ### devname.h

    #
    # extern int tty_to_dev(const char *__restrict const name);
    #
    attach_function :tty_to_dev, [:string], :int

    # TODO
    #
    # extern unsigned dev_to_tty(char *__restrict ret, unsigned chop, dev_t dev_t_dev, int pid, unsigned int flags);


    ### pwcache.h

    #
    # extern char *user_from_uid(uid_t uid);
    #
    attach_function :user_from_uid, [:uint], :string

    # TODO
    #
    # extern char *group_from_gid(gid_t gid);
    #


    ### whattime.h

    #
    # extern void print_uptime(void);
    #
    attach_function :print_uptime, [], :void

    #
    # extern char *sprint_uptime(void);
    #
    attach_function :sprint_uptime, [], :string


    ### sysinfo.h

    #
    # extern void meminfo(void);
    #
    attach_function :meminfo, [], :void

    #
    # extern void vminfo (void);
    #
    attach_function :vminfo, [], :void


    class Proc_t < FFI::Struct
      layout :tid,  :int,
        :ppid,  :int,
        :pcpu, :uint,
        :state, :char,
        :pad_1, :char,
        :pad_2, :char,
        :pad_3, :char,
        :utime, :ulong_long,
        :stime, :ulong_long,
        :cutime, :ulong_long,
        :cstime, :ulong_long,
        :start_time, :ulong_long,
        :signal, :long_long,
        :blocked, :long_long,
        :sigignore, :long_long,
        :sigcatch, :long_long,
        :_sigpnd, :long_long,
        :start_code, :ulong_long,
        :end_code, :ulong_long,
        :start_stack, :ulong_long,
        :kstk_esp, :ulong_long,
        :kstk_eip, :ulong_long,
        :wchan, :ulong_long,
        :priority, :long,
        :nice, :long,
        :rss, :long,
        :alarm, :long,
        :size, :long,
        :resident, :long,
        :share, :long,
        :trs, :long,
        :lrs, :long,
        :drs, :long,
        :dt, :long,
        :vm_size, :ulong,
        :vm_lock, :ulong,
        :vm_rss, :ulong,
        :vm_data, :ulong,
        :vm_stack, :ulong,
        :vm_swap, :ulong,
        :vm_exe, :ulong,
        :vm_lib, :ulong,
        :rtprio, :ulong,
        :sched, :ulong,
        :vsize, :ulong,
        :rss_rlim, :ulong,
        :flags, :ulong,
        :min_flt, :ulong,
        :maj_flt, :ulong,
        :cmin_flt, :ulong,
        :cmaj_flt, :ulong,

        :environ, :pointer,
        :cmdline, :pointer,
        :cgroup, :pointer,
        :supgid, :pointer,
        :supgrp, :pointer,

        :euser, [:char, 20],
        :ruser, [:char, 20],
        :suser, [:char, 20],
        :fuser, [:char, 20],
        :rgroup, [:char, 20],
        :egroup, [:char, 20],
        :sgroup, [:char, 20],
        :fgroup, [:char, 20],
        :cmd, [:char, 16],

        :ring, :pointer,
        :next, :pointer,

        :pgrp, :int,
        :session, :int,
        :nlwp, :int,
        :tgid, :int,
        :tty, :int,
        :euid, :int,
        :egid, :int,
        :ruid, :int,
        :rgid, :int,
        :suid, :int,
        :sgid, :int,
        :fuid, :int,
        :fgid, :int,
        :tpgid, :int,
        :exit_signal, :int,
        :processor, :int,

        :oom_store, :int,
        :oom_adj, :int
    end

    ### readproc.h

    #
    # extern proc_t** readproctab(int flags, ... /* same as openproc */ );
    #
    attach_function :readproctab, [:int, :varargs], :pointer

  end
end
