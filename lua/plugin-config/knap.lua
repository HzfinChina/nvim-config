local gknapsettings = {
    -- texsettings
    texoutputext = "pdf",
    textopdf = "pdflatex -synctex=1 -halt-on-error -interaction=batchmode %docroot%",
    textopdfviewerlaunch = "zathura %outputfile%",
    textopdfviewerrefresh = "kill -HUP %pid%"

    -- markdown settings
}
vim.g.knap_settings = gknapsettings
