competition{
    cid 比赛id
    typeid 赛道类型id
    holdername 主办方名字
    name 比赛名字
    enname 比赛英文名称
    prize 奖金
    rewards 奖品
    start_time 开始时间
    end_time 结束时间
    status 状态（running、upcoming、archived）
    content 比赛详情
    rules 详细规则
    commit_request 提交要求
    rewards_setting 奖项设置

}

//资源包
competition_resourse{
    fid 文件id
    cid 比赛id
}


copetition_notice{
    cid 比赛id
    nid 公告id
    istop 是否置顶
    title 标题
    time 时间
    content 详情
}

competition_type{
    typeid 比赛类型id
    name 类型名字
    create_time 创建时间
}
