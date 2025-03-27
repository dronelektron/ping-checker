static Handle g_timer;

void Timer_CkeckPlayersPing_Kill() {
    delete g_timer;
}

void Timer_CkeckPlayersPing_Create() {
    float delay = Variable_Interval() * 1.0;

    g_timer = CreateTimer(delay, OnCkeckPlayersPing, _, TIMER_FLAGS);
}

static Action OnCkeckPlayersPing(Handle timer) {
    UseCase_CheckPlayersPing();

    return Plugin_Continue;
}
