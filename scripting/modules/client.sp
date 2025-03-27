static int g_warnings[MAXPLAYERS + 1];

void Client_Reset(int client) {
    g_warnings[client] = 0;
}

void Client_AddWarnings(int client) {
    g_warnings[client]++;
}

int Client_GetWarnings(int client) {
    return g_warnings[client];
}
