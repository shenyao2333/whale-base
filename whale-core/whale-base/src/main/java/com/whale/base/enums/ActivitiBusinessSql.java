package com.whale.base.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * <p>
 * activiti业务逻辑处理Sql
 * </p>
 *
 * @Author: entfrm开发团队-王翔
 * @Date: 2021/4/18
 */
@Getter
@AllArgsConstructor
public enum ActivitiBusinessSql {


    PROCESS_TRACKING_HISTORIC_TASK_INSTANCE(
            "流程追踪-历史任务实例查询",
            "select * from act_hi_taskinst where proc_inst_id_= #{procInstId} and duration_ is not null order by start_time_,end_time_  desc",
            null),
    PROCESS_TASK_HISTORIC_TASK_INSTANCE(
            "流程任务-历史任务实例查询",
            "select * from act_hi_taskinst where assignee_= #{currentUser} %s and duration_ is not null order by start_time_ desc",
            new String[]{"and name_ like #{taskName}"}
    );

    private String name;
    private String sql;
    private String[] condition;

}
