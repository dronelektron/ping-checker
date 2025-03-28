static ConVar g_maxPing;
static ConVar g_maxWarnings;
static ConVar g_interval;
static ConVar g_logging;

void Variable_Create() {
    g_maxPing = CreateConVar("sm_pingchecker_max_ping", "150", "Maximum ping");
    g_maxWarnings = CreateConVar("sm_pingchecker_max_warnings", "3", "The number of warnings after which the player will be kicked");
    g_interval = CreateConVar("sm_pingchecker_interval", "10", "How often to check the ping (in seconds)");
    g_logging = CreateConVar("sm_pingchecker_logging", "1", "Enable (1) or disable (0) logging");
    g_interval.AddChangeHook(OnInterval);
}

int Variable_MaxPing() {
    return g_maxPing.IntValue;
}

int Variable_MaxWarnings() {
    return g_maxWarnings.IntValue;
}

int Variable_Interval() {
    return g_interval.IntValue;
}

bool Variable_Logging() {
    return g_logging.BoolValue;
}

static void OnInterval(ConVar variable, const char[] oldValue, const char[] newValue) {
    int interval = StringToInt(newValue);

    if (interval < TIMER_DELAY_MINIMUM) {
        g_interval.SetInt(TIMER_DELAY_MINIMUM);
    }

    Timer_CkeckPlayersPing_Kill();
    Timer_CkeckPlayersPing_Create();
}
