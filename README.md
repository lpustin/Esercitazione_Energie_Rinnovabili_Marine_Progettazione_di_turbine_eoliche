# Esercitazione_Energie_Rinnovabili_Marine_Progettazione_di_turbine_eoliche

Questo repository nasce per gli studenti di RomaTre del corso Energie Rinnovabili Marine:Progettazione di turbine eoliche <br />

L'esercitazione è divisa in tre punti: <br />
1) Interpolare con delle funzioni di forma polinomiali i coefficienti di spinta (Ct) e potenza aerodinamica della turbina (Cp). Ipotizzare una dipendenza da due variabili: il passo collettivo e il valore adimensionale 'Tip-Speed-ratio'. Vengono fornite un set di simulazioni stazionarie effettuate con OpenFAST (file 'FAST_Steady_Simulations.mat') e lo script 'read_Steady_Simul.m' per facilitarne la lettura.  <br />
 <br />
2) Valutare la bontà della approssimazione ottenuta confrontando la potenza e la spinta aerodinamica con gli output delle simulazioni ad alta fedeltà effettuate con OpenFAST. Effettuare l'analisi per le tre condizioni operative fornite (cartella 'Load_Cases'). Considerare la velocità angolare, il passo di pala ed il vento effettivo di OpenFAST per valutare la potenza e la spinta utilizzando le espressioni polinomiali del Cp e del Ct ottenute nel punto 1. Viene fornito lo script Matlab read_Wind_and_Plot_OpenFAST_Data.m per facilitare la lettura dei principali valori delle simulazioni ad alta fedeltà.  <br />
 <br />
3) Creare un modello di ordine ridotto della turbina ad un grado di libertà (velocità angolare del rotore). Includere gli effetti inerziali del rotore, la coppia aerodinamica e la coppia al generatore. Viene fornito il file 'wind_turbine_main_data.m' con le informazioni sulla trasmissione, sul generatore e sul rotore necessarie. Confrontare gli output del modello di ordine ridotto (velocità angolare, potenza e spinta aerodinamica) con le simulazioni ad alta fedeltà fornite (cartella 'Load_Cases'). Considerare la stessa legge di controllo (passo collettivo di pala e coppia al generatore) delle simulazioni ad alta fedeltà. <br />
 <br />
