#include "FreeRTOS.h"
#include "task.h"
#include <stdio.h>

// Task-Funktion: Gibt jede Sekunde "Hello FreeRTOS" aus
void vTaskHello(void *pvParameters) {
    (void) pvParameters;
    for (;;) {
        printf("Hello FreeRTOS!\n");
        vTaskDelay(pdMS_TO_TICKS(1000)); // 1000 ms warten
    }
}

int main(void) {
    // Task erstellen
    xTaskCreate(vTaskHello, "HelloTask", configMINIMAL_STACK_SIZE, NULL, 1, NULL);

    // Scheduler starten (blockiert hier)
    vTaskStartScheduler();

    // Sollte nie hierher kommen
    printf("Scheduler ended unexpectedly.\n");
    return 0;
}
