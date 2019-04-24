#!/bin/bash

## From: https://github.com/bosch-robotics-cr/tracetools/blob/devel/scripts/setup-lttng-roscpp.sh

# set up ust roscpp events
for event in roscpp:new_connection roscpp:callback_added roscpp:timer_added\
    roscpp:callback_start roscpp:callback_end roscpp:publisher_link_handle_message\
    roscpp:subscription_message_queued roscpp:subscription_message_dropped\
    roscpp:subscriber_callback_start roscpp:subscriber_callback_end\
    roscpp:publisher_message_queued	roscpp:subscriber_link_message_write\
    roscpp:subscriber_link_message_dropped roscpp:subscriber_callback_added\
    roscpp:subscriber_callback_wrapper roscpp:task_start\
    roscpp:init_node roscpp:shutdown_node\
    nodelet:task_start nodelet:init tf2:task_start roscpp:message_processed\
    roscpp:trace_link roscpp:ptr_name_info roscpp:ptr_call roscpp:timer_scheduled
do
	lttng enable-event -c roscpp -u $event 
done

lttng enable-event --kernel lttng_logger

# process context
lttng add-context -c roscpp -u \
  -t vpid -t procname \
  -t vtid -t perf:thread:instructions \
  -t perf:thread:cycles -t perf:thread:cpu-cycles

#kernel
lttng enable-channel --kernel kchan --subbuf-size=8M

# network
for event in net_dev_queue netif_receive_skb net_if_receive_skb
do
    lttng enable-event --kernel --channel=kchan $event
done

# other kernel stuff
for event in sched_switch sched_waking sched_pi_setprio sched_process_fork sched_process_exit sched_process_free sched_wakeup\
    irq_softirq_entry irq_softirq_raise irq_softirq_exit irq_handler_entry irq_handler_exit\
    lttng_statedump_process_state lttng_statedump_start lttng_statedump_end lttng_statedump_network_interface lttng_statedump_block_device\
    block_rq_complete block_rq_insert block_rq_issue\
    block_bio_frontmerge sched_migrate sched_migrate_task power_cpu_frequency\
    net_dev_queue netif_receive_skb net_if_receive_skb\
    timer_hrtimer_start timer_hrtimer_cancel timer_hrtimer_expire_entry timer_hrtimer_expire_exit
do
    lttng enable-event --kernel --channel=kchan $event
done

# lttng enable-event -k --syscall --all
