static ConVar g_maxPing;

void Variable_Create() {
    g_maxPing = CreateConVar("sm_pingchecker_max_ping", "150", "Maximum ping");
}

int Variable_MaxPing() {
    return g_maxPing.IntValue;
}
