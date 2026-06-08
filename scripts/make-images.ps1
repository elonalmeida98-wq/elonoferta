Add-Type -AssemblyName System.Drawing

$dir = "C:\Users\Elon Saide\Downloads\saveweb2zip-com-dailysolutions-site\images"

function Make-Placeholder {
    param($path, $w, $h, $r, $g, $b, $fr, $fg, $fb, $circle)
    $bmp = New-Object System.Drawing.Bitmap([int]$w, [int]$h)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = "HighQuality"
    $c1 = [System.Drawing.Color]::FromArgb([int]$r, [int]$g, [int]$b)
    $c2 = [System.Drawing.Color]::FromArgb([int]($r+20), [int]($g+15), [int]($b+10))
    $pt1 = New-Object System.Drawing.Point(0, 0)
    $pt2 = New-Object System.Drawing.Point([int]$w, [int]$h)
    $br = New-Object System.Drawing.Drawing2D.LinearGradientBrush($pt1, $pt2, $c1, $c2)
    $g.FillRectangle($br, 0, 0, [int]$w, [int]$h)
    if ($circle) {
        $cb = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb([int]$fr, [int]$fg, [int]$fb))
        $g.FillEllipse($cb, ([int]($w/2)-40), ([int]($h/2)-40), 80, 80)
        $ff = New-Object System.Drawing.Font("Arial", 36, [System.Drawing.FontStyle]::Bold)
        $sf = New-Object System.Drawing.StringFormat
        $sf.Alignment = "Center"
        $sf.LineAlignment = "Center"
        $wb = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::White)
        $g.DrawString("?", $ff, $wb, ($w/2), ($h/2), $sf)
    } else {
        $ff = New-Object System.Drawing.Font("Arial", 18, [System.Drawing.FontStyle]::Bold)
        $sf = New-Object System.Drawing.StringFormat
        $sf.Alignment = "Center"
        $sf.LineAlignment = "Center"
        $wb = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::White)
        $g.DrawString("CONTEUDO BLOQUEADO`nDesbloqueie para acessar", $ff, $wb, ($w/2), ($h/2), $sf)
    }
    $pn = New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(0,255,136), 2)
    $g.DrawRectangle($pn, 0, 0, ($w-1), ($h-1))
    $bmp.Save($path, [System.Drawing.Imaging.ImageFormat]::Jpeg)
    $g.Dispose()
    $bmp.Dispose()
    $br.Dispose()
}

Make-Placeholder "$dir\default-profile.jpg" 120 120 20 30 40 0 255 136 $true
Make-Placeholder "$dir\Untitled-1.jpg" 500 800 10 20 30 0 255 136 $false
Make-Placeholder "$dir\print-02-confidencial-v2-1.jpg" 500 800 15 25 35 0 229 255 $false

Write-Output "Imagens criadas"
