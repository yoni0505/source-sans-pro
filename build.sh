#!/usr/bin/env sh

family=SourceSansPro
romanWeights='Black Bold ExtraLight Light Regular Semibold'
italicWeights='BlackIt BoldIt ExtraLightIt LightIt It SemiboldIt'

# clean existing build artifacts
rm -rf target/
otfDir="target/OTF"
ttfDir="target/TTF"
mkdir -p $otfDir $ttfDir

for w in $romanWeights
do
  font_path=Roman/Instances/$w/font
  makeotf -f $font_path.ufo -r -o $otfDir/$family-$w.otf
  makeotf -f $font_path.ttf -r -o $ttfDir/$family-$w.ttf -ff $font_path.ufo/features.fea
done

for w in $italicWeights
do
  font_path=Italic/Instances/$w/font
  makeotf -f $font_path.ufo -r -o $otfDir/$family-$w.otf
  makeotf -f $font_path.ttf -r -o $ttfDir/$family-$w.ttf -ff $font_path.ufo/features.fea
done
