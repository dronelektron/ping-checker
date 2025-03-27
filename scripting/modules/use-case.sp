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

    if (Forward_OnClient(client) == Plugin_Stop) {
        return;
    }

    int ping = GetPing(client);
    int maxPing = Variable_MaxPing();

    if (ping <= maxPing) {
        Client_Reset(client);

        return;
    }

    int warnings = Client_GetWarnings(client);

    if (warnings < Variable_MaxWarnings()) {
        Client_AddWarnings(client);

        return;
    }

    KickClient(client, "%t", "High ping", ping, maxPing);
}

static int GetPing(int client) {
    float seconds = GetClientLatency(client, NetFlow_Both);
    float milliseconds = seconds * MILLISECONDS_IN_SECOND;

    return RoundToNearest(milliseconds);
}
