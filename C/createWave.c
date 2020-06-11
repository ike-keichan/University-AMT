#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "wave.h"

/* サイン波 */
void createSinWave(double f0, char filename[25]){

    MONO_PCM pcm1;
    double A;

    pcm1.fs = 44100; /* 標本化周波数 */
    pcm1.bits = 16; /* 量子化精度 */
    pcm1.length = 50000; /* 音データの長さ */
    pcm1.s = calloc(pcm1.length, sizeof(double)); /* メモリの確保 */

    A = 1; /* 振幅 */

    for (int i = 0; i < pcm1.length; i++)
    {
        pcm1.s[i] = A * sin(2.0 * M_PI * f0 * i / pcm1.fs);
    }

    mono_wave_write(&pcm1, filename); /* WAVEファイルにモノラルの音データを出力する */

    free(pcm1.s); /* メモリの解放 */
}

/* ノコギリ波 */
void createSawtoothWave(double f0, char filename[25]){

    MONO_PCM pcm1;
    double A;

    pcm1.fs = 44100; /* 標本化周波数 */
    pcm1.bits = 16; /* 量子化精度 */
    pcm1.length = 50000; /* 音データの長さ */
    pcm1.s = calloc(pcm1.length, sizeof(double)); /* メモリの確保 */

    A = 1; /* 振幅 */

    for (int i = 0; i < pcm1.length; i++)
    {
        for (int j = 3; j <= 11; j += 4)
        {
        pcm1.s[i] += 2 * A / j * sin(2.0 * M_PI * f0 * j * i / pcm1.fs);
        }
    }

    mono_wave_write(&pcm1, filename); /* WAVEファイルにモノラルの音データを出力する */

    free(pcm1.s); /* メモリの解放 */
}

/* 三角波 */
void createTriangleWave(double f0, char filename[25]){

    MONO_PCM pcm1;
    double A;

    pcm1.fs = 44100; /* 標本化周波数 */
    pcm1.bits = 16; /* 量子化精度 */
    pcm1.length = 50000; /* 音データの長さ */
    pcm1.s = calloc(pcm1.length, sizeof(double)); /* メモリの確保 */

    A = 1; /* 振幅 */

    for (int i = 0; i < pcm1.length; i++)
    {
        for (int j = 3; j <=11; j += 4)
        {
         pcm1.s[i] += 8 * A / (j * j) * sin(j * M_PI / 2) * sin(2.0 * M_PI * f0 * j * i / pcm1.fs);
        }
    }

    mono_wave_write(&pcm1, filename); /* WAVEファイルにモノラルの音データを出力する */

    free(pcm1.s); /* メモリの解放 */
}

/* 矩形波 */
void createSquareWave(double f0, char filename[25]){

    MONO_PCM pcm1;
    double A;

    pcm1.fs = 44100; /* 標本化周波数 */
    pcm1.bits = 16; /* 量子化精度 */
    pcm1.length = 50000; /* 音データの長さ */
    pcm1.s = calloc(pcm1.length, sizeof(double)); /* メモリの確保 */

    A = 1; /* 振幅 */

    for (int i = 0; i < pcm1.length; i++)
    {
        for (int j = 3; j <= 11; j += 4)
        {
        pcm1.s[i] += 4 * A / (2 * j - 1) * sin(2.0 * M_PI * f0 * (2 * j - 1) * i / pcm1.fs);
        }
    }

    mono_wave_write(&pcm1, filename); /* WAVEファイルにモノラルの音データを出力する */

    free(pcm1.s); /* メモリの解放 */
}

int main(void)
{

    /* サイン波 */
    createSinWave(200, "SinWave_200Hz.wav");
    createSinWave(500, "SinWave_500Hz.wav");
    createSinWave(2000, "SinWave_2kHz.wav");
    createSinWave(5000, "SinWave_5kHz.wav");

    /* ノコギリ波 */
    createSawtoothWave(200, "SawtoothWave_200Hz.wav");
    createSawtoothWave(500, "SawtoothWave_500Hz.wav");
    createSawtoothWave(2000, "SawtoothWave_2kHz.wav");
    createSawtoothWave(5000, "SawtoothWave_5kHz.wav");

    /* 三角波 */
    createTriangleWave(200, "TriangleWave_200Hz.wav");
    createTriangleWave(500, "TriangleWave_500Hz.wav");
    createTriangleWave(2000, "TriangleWave_2kHz.wav");
    createTriangleWave(5000, "TriangleWave_5kHz.wav");

    /* 矩形波 */
    createSquareWave(200, "SquareWave_200Hz.wav");
    createSquareWave(500, "SquareWave_500Hz.wav");
    createSquareWave(2000, "SquareWave_2kHz.wav");
    createSquareWave(5000, "SquareWave_5kHz.wav");

    return 0;
}
