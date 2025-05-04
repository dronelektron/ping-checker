#include <sourcemod>

#include "ping-checker/timer"
#include "ping-checker/use-case"

#include "modules/client.sp"
#include "modules/console-variable.sp"
#include "modules/forward.sp"
#include "modules/message.sp"
#include "modules/timer.sp"
#include "modules/use-case.sp"

public Plugin myinfo = {
    name = "Ping checker",
    author = "Dron-elektron",
    description = "Allows you to kick players with high ping",
    version = "1.1.0",
    url = "https://github.com/dronelektron/ping-checker"
};

public void OnPluginStart() {
    Variable_Create();
    Forward_Create();
    LoadTranslations("ping-checker.phrases");
    AutoExecConfig(_, "ping-checker");
}

public void OnMapStart() {
    Timer_CkeckPlayersPing_Create();
}

public void OnClientConnected(int client) {
    Client_Reset(client);
}
