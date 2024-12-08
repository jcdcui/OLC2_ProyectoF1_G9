import * as Parser from "./peg-parser";

export default function parseInput(input: string): string {
    try {
        const result = Parser.parse(input);
        //return `Número de reglas: ${count}`;
        //return JSON.stringify(count)
        return `Gramatica Aceptada! Se han detectado ${result.length} reglas`
    } catch (e) {
        if (e instanceof Error) {
            return `Error: ${e.message}`;
        } else {
            return `Error desconocido: ${JSON.stringify(e)}`;
        }
    }
}