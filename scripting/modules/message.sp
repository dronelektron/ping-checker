void Message_HighPing(int client, int ping, int maxPing) {
    if (!Variable_Logging()) {
        return;
    }

    LogMessage("\"%L\" is kicked for high ping (%d), maximum (%d)", client, ping, maxPing);
}
