/*******************************************************************************
 * FadeColor generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class FadeColor extends ConstantMaterial
    native
    exportstructs
    hidecategories(Object);

cpptext
{
// Stripped
}

var() Color Color1;
var() Color Color2;
var() float FadePeriod;
var() float FadePhase;
var() Object.EColorFadeType ColorFadeType;
var() string FadeString;
var transient float NextFlickerTime;
var transient float LastPercent;