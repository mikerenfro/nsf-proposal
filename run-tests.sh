#!/bin/bash

make_build_check_document() {
    basefile=${font}-${engine}${usetg}-${fontsize}
    echo "${basefile}"
    echo "\documentclass[${font}${usetg},${fontsize}]{nsf-proposal} \input{nsf-demo-content}" > ${basefile}.tex
    latexmk -CA ${basefile} >& /dev/null
    latexmk -${engine} ${basefile} < /dev/null >& /dev/null
    if [ -f ${basefile}.pdf ]; then
        pdffonts ${basefile}.pdf
        mkdir -p sample-output/${font}
        mv ${basefile}.pdf sample-output/${font}/
        pdftk sample-output/${font}/${basefile}.pdf cat 1 output sample-output/${font}/${basefile}-summary.pdf
        pdftk sample-output/${font}/${basefile}.pdf cat 2-3 output sample-output/${font}/${basefile}-description.pdf
        pdftk sample-output/${font}/${basefile}.pdf cat 4 output sample-output/${font}/${basefile}-references.pdf
    else
        echo "No output ${basefile}.pdf"
    fi
    latexmk -CA ${basefile} >& /dev/null
    rm -f rm -f *.bbl *.run.xml
    rm -f ${basefile}.tex
    echo ""
}

engine=pdf
usetg=""
for font in cm helvetica palatino; do
    for fontsize in 10pt 11pt 12pt; do
        make_build_check_document
    done
done

engine=pdflua
for font in arial cm courier-new helvetica palatino palatino-linotype times-new-roman; do
    for usetg in ",tg" ""; do
        for fontsize in 10pt 11pt 12pt; do
            make_build_check_document
        done
    done
done

engine=pdfxe
for font in arial cm courier-new helvetica palatino palatino-linotype times-new-roman; do
    for usetg in ",tg" ""; do
        for fontsize in 10pt 11pt 12pt; do
            make_build_check_document
        done
    done
done

# TeX Gyre doesn't apply to Arial or Computer Modern -- remove the duplicate PDFs
find sample-output/{arial,cm} -name '*,tg-*.pdf' -print0 | xargs -0 rm

cat <<EOD
| Engine:      | pdf*       | pdf*       | pdf*       | xe*        | xe*        | xe*        | lua*       | lua*       | lua*       |
| -----------: | :--------: | :--------: | :--------: | :--------: | :--------: | :--------: | :--------: | :--------: | :--------: |
| **Font**     | 10&nbsp;pt | 11&nbsp;pt | 12&nbsp;pt | 10&nbsp;pt | 11&nbsp;pt | 12&nbsp;pt | 10&nbsp;pt | 11&nbsp;pt | 12&nbsp;pt |
EOD

for font in arial cm courier-new helvetica palatino palatino-linotype times-new-roman; do
    for usetg in "" ",tg"; do
        case ${font} in
            "arial") fontname="Arial";;
            "cm") fontname="Computer Modern";;
            "courier-new") fontname="Courier New";;
            "helvetica") fontname="Helvetica";;
            "palatino") fontname="Palatino";;
            "palatino-linotype") fontname="Palatino Linotype";;
            "times-new-roman") fontname="Times New Roman";;
        esac
        suffix=""
        case ${font}${usetg} in
            "arial,tg") break;;
            "cm,tg") break;;
            "courier-new,tg") suffix=" (TeX Gyre Cursor)";;
            "helvetica,tg") suffix=" (TeX Gyre Heros)";;
            "palatino,tg") suffix=" (TeX Gyre Pagella)";;
            "palatino-linotype,tg") break;;
            "times-new-roman,tg") suffix=" (TeX Gyre Termes)";;
        esac
        echo -ne "| ${fontname}${suffix} | "
        for engine in pdf pdfxe pdflua; do
            for size in 10 11 12; do
                if [ -r sample-output/${font}/${font}-${engine}${usetg}-${size}pt.pdf ]; then
                    if [ -r sample-output/${font}/${font}-${engine}${usetg}-${size}pt-summary.pdf ]; then
                        echo -ne "[S](sample-output/${font}/${font}-${engine}${usetg}-${size}pt-summary.pdf) "
                    fi
                    if [ -r sample-output/${font}/${font}-${engine}${usetg}-${size}pt-description.pdf ]; then
                        echo -ne "[D](sample-output/${font}/${font}-${engine}${usetg}-${size}pt-description.pdf) "
                    fi
                    if [ -r sample-output/${font}/${font}-${engine}${usetg}-${size}pt-references.pdf ]; then
                        echo -ne "[R](sample-output/${font}/${font}-${engine}${usetg}-${size}pt-references.pdf) "
                    fi
                    echo -ne "[C](sample-output/${font}/${font}-${engine}${usetg}-${size}pt.pdf) | "
                else
                    echo -ne " N/A | "
                fi
            done
        done
    echo ""
    done
done