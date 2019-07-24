export interface OctoprintJobAPI {
    job: OctoprintJob;
    progress: OctoprintProgress;
    state: string;
}

interface OctoprintJob {
    file: OctoprintFile;
    estimatedPrintTime: number;
    filament: OctoprintFilament;
}

interface OctoprintFile {
    name: string;
    origin: string;
    display: string;
    path?: string;
    type?: string;
    typePath?: string;
    size: number;
    date: number;
}

interface OctoprintFilament {
    tool0: OctoprintFilamentValues;
    tool1: OctoprintFilamentValues;
    [key: string]: any;
}

interface OctoprintFilamentValues {
    length: number;
    volume: number;
}

interface OctoprintProgress {
    completion: number;
    filepos: number;
    printTime: number;
    printTimeLeft: number;
}

export interface JobCommand {
    command: string;
    action?: string;
}