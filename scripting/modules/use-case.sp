void UseCase_CheckPlayersPing() {
    for (int client = 1; client <= MaxClients; client++) {
        if (IsClientInGame(client)) {
            CheckPing(client);
        }
    }
}

static void CheckPing(int client) {
    if (IsFakeClient(client) || IsClientSourceTV(client)) {
        return;
    }

    int ping = GetPing(client);
    int maxPing = Variable_MaxPing();

    if (ping > maxPing) {
        KickClient(client, "%t", "High ping", ping, maxPing);
    }
}

static int GetPing(int client) {
    float seconds = GetClientLatency(client, NetFlow_Both);
    float milliseconds = seconds * MILLISECONDS_IN_SECOND;

    return RoundToNearest(milliseconds);
}
