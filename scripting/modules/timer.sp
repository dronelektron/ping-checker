void Timer_CkeckPlayersPing() {
    CreateTimer(TIMER_DELAY, OnCkeckPlayersPing, _, TIMER_FLAGS);
}

static Action OnCkeckPlayersPing(Handle timer) {
    UseCase_CheckPlayersPing();

    return Plugin_Continue;
}
