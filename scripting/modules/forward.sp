static GlobalForward g_onClient;

void Forward_Create() {
    g_onClient = new GlobalForward("PingChecker_OnClient", ET_Hook, Param_Cell, Param_Cell);
}

Action Forward_OnClient(int client) {
    Action result = Plugin_Continue;

    Call_StartForward(g_onClient);
    Call_PushCell(client);
    Call_Finish(result);

    return result;
}
