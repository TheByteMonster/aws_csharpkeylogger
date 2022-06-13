﻿param($installPath, $toolsPath, $package, $project)

$analyzersPaths = Join-Path (Join-Path (Split-Path -Path $toolsPath -Parent) "analyzers" ) * -Resolve

foreach($analyzersPath in $analyzersPaths)
{
    # Install the language agnostic analyzers.
    if (Test-Path $analyzersPath)
    {
        foreach ($analyzerFilePath in Get-ChildItem $analyzersPath -Filter *.dll)
        {
            if($project.Object.AnalyzerReferences)
            {
                $project.Object.AnalyzerReferences.Add($analyzerFilePath.FullName)
            }
        }
    }
}

# $project.Type gives the language name like (C# or VB.NET)
$languageFolder = ""
if($project.Type -eq "C#")
{
    $languageFolder = "cs"
}
if($project.Type -eq "VB.NET")
{
    $languageFolder = "vb"
}
if($languageFolder -eq "")
{
    return
}

foreach($analyzersPath in $analyzersPaths)
{
    # Install language specific analyzers.
    $languageAnalyzersPath = join-path $analyzersPath $languageFolder
    if (Test-Path $languageAnalyzersPath)
    {
        foreach ($analyzerFilePath in Get-ChildItem $languageAnalyzersPath -Filter *.dll)
        {
            if($project.Object.AnalyzerReferences)
            {
                $project.Object.AnalyzerReferences.Add($analyzerFilePath.FullName)
            }
        }
    }
}
# SIG # Begin signature block
# MIIm2AYJKoZIhvcNAQcCoIImyTCCJsUCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDZJBZzcs7cfqM9
# MWr2aPykOqNSy5POJYRMX2iYAyfLG6CCDlkwggawMIIEmKADAgECAhAIrUCyYNKc
# TJ9ezam9k67ZMA0GCSqGSIb3DQEBDAUAMGIxCzAJBgNVBAYTAlVTMRUwEwYDVQQK
# EwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xITAfBgNV
# BAMTGERpZ2lDZXJ0IFRydXN0ZWQgUm9vdCBHNDAeFw0yMTA0MjkwMDAwMDBaFw0z
# NjA0MjgyMzU5NTlaMGkxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwg
# SW5jLjFBMD8GA1UEAxM4RGlnaUNlcnQgVHJ1c3RlZCBHNCBDb2RlIFNpZ25pbmcg
# UlNBNDA5NiBTSEEzODQgMjAyMSBDQTEwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAw
# ggIKAoICAQDVtC9C0CiteLdd1TlZG7GIQvUzjOs9gZdwxbvEhSYwn6SOaNhc9es0
# JAfhS0/TeEP0F9ce2vnS1WcaUk8OoVf8iJnBkcyBAz5NcCRks43iCH00fUyAVxJr
# Q5qZ8sU7H/Lvy0daE6ZMswEgJfMQ04uy+wjwiuCdCcBlp/qYgEk1hz1RGeiQIXhF
# LqGfLOEYwhrMxe6TSXBCMo/7xuoc82VokaJNTIIRSFJo3hC9FFdd6BgTZcV/sk+F
# LEikVoQ11vkunKoAFdE3/hoGlMJ8yOobMubKwvSnowMOdKWvObarYBLj6Na59zHh
# 3K3kGKDYwSNHR7OhD26jq22YBoMbt2pnLdK9RBqSEIGPsDsJ18ebMlrC/2pgVItJ
# wZPt4bRc4G/rJvmM1bL5OBDm6s6R9b7T+2+TYTRcvJNFKIM2KmYoX7BzzosmJQay
# g9Rc9hUZTO1i4F4z8ujo7AqnsAMrkbI2eb73rQgedaZlzLvjSFDzd5Ea/ttQokbI
# YViY9XwCFjyDKK05huzUtw1T0PhH5nUwjewwk3YUpltLXXRhTT8SkXbev1jLchAp
# QfDVxW0mdmgRQRNYmtwmKwH0iU1Z23jPgUo+QEdfyYFQc4UQIyFZYIpkVMHMIRro
# OBl8ZhzNeDhFMJlP/2NPTLuqDQhTQXxYPUez+rbsjDIJAsxsPAxWEQIDAQABo4IB
# WTCCAVUwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUaDfg67Y7+F8Rhvv+
# YXsIiGX0TkIwHwYDVR0jBBgwFoAU7NfjgtJxXWRM3y5nP+e6mK4cD08wDgYDVR0P
# AQH/BAQDAgGGMBMGA1UdJQQMMAoGCCsGAQUFBwMDMHcGCCsGAQUFBwEBBGswaTAk
# BggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29tMEEGCCsGAQUFBzAC
# hjVodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRUcnVzdGVkUm9v
# dEc0LmNydDBDBgNVHR8EPDA6MDigNqA0hjJodHRwOi8vY3JsMy5kaWdpY2VydC5j
# b20vRGlnaUNlcnRUcnVzdGVkUm9vdEc0LmNybDAcBgNVHSAEFTATMAcGBWeBDAED
# MAgGBmeBDAEEATANBgkqhkiG9w0BAQwFAAOCAgEAOiNEPY0Idu6PvDqZ01bgAhql
# +Eg08yy25nRm95RysQDKr2wwJxMSnpBEn0v9nqN8JtU3vDpdSG2V1T9J9Ce7FoFF
# UP2cvbaF4HZ+N3HLIvdaqpDP9ZNq4+sg0dVQeYiaiorBtr2hSBh+3NiAGhEZGM1h
# mYFW9snjdufE5BtfQ/g+lP92OT2e1JnPSt0o618moZVYSNUa/tcnP/2Q0XaG3Ryw
# YFzzDaju4ImhvTnhOE7abrs2nfvlIVNaw8rpavGiPttDuDPITzgUkpn13c5Ubdld
# AhQfQDN8A+KVssIhdXNSy0bYxDQcoqVLjc1vdjcshT8azibpGL6QB7BDf5WIIIJw
# 8MzK7/0pNVwfiThV9zeKiwmhywvpMRr/LhlcOXHhvpynCgbWJme3kuZOX956rEnP
# LqR0kq3bPKSchh/jwVYbKyP/j7XqiHtwa+aguv06P0WmxOgWkVKLQcBIhEuWTatE
# QOON8BUozu3xGFYHKi8QxAwIZDwzj64ojDzLj4gLDb879M4ee47vtevLt/B3E+bn
# KD+sEq6lLyJsQfmCXBVmzGwOysWGw/YmMwwHS6DTBwJqakAwSEs0qFEgu60bhQji
# WQ1tygVQK+pKHJ6l/aCnHwZ05/LWUpD9r4VIIflXO7ScA+2GRfS0YW6/aOImYIbq
# yK+p/pQd52MbOoZWeE4wggehMIIFiaADAgECAhALyko14sGCglkXWPsT8gmbMA0G
# CSqGSIb3DQEBCwUAMGkxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwg
# SW5jLjFBMD8GA1UEAxM4RGlnaUNlcnQgVHJ1c3RlZCBHNCBDb2RlIFNpZ25pbmcg
# UlNBNDA5NiBTSEEzODQgMjAyMSBDQTEwHhcNMjExMjI4MDAwMDAwWhcNMjMwMTAz
# MjM1OTU5WjCB9jEdMBsGA1UEDwwUUHJpdmF0ZSBPcmdhbml6YXRpb24xEzARBgsr
# BgEEAYI3PAIBAxMCVVMxGTAXBgsrBgEEAYI3PAIBAhMIRGVsYXdhcmUxEDAOBgNV
# BAUTBzQxNTI5NTQxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAw
# DgYDVQQHEwdTZWF0dGxlMSIwIAYDVQQKExlBbWF6b24gV2ViIFNlcnZpY2VzLCBJ
# bmMuMRcwFQYDVQQLEw5TREtzIGFuZCBUb29sczEiMCAGA1UEAxMZQW1hem9uIFdl
# YiBTZXJ2aWNlcywgSW5jLjCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGB
# AKHRLdQSyJ6AfhQ8U7Gi6le7gshUhu34xQ7jaTCfpKaKQRGu+oNfAYDRSSfh498e
# K+jFnGHU/TMzVHEgBb4TUrc1e2f5LHhXAtYTJK0uis9OJ5n3MjHwOJt/uGSSMUAI
# IIselvbSF2mOE0lIz0CNMIlUiXI9O+y9+FJP7Vsg/NU/zAVsQ4Ok0GLd+Yp566nR
# uj9aNU+L+TxRhSHA7KKjJ9oE0mVblUGQaeNrOd1Ql9djJy0pg6oT2s9Peh8lqB3t
# UsMaoQ/FMV0P/e1S6V3yFg/I1OvQdtm29ryJTdg9ZvIV/FGnIYdW5s5T8t//nf+7
# LToQVhpML/ZWEhFRAa6We80Y8zs9glIPDZyYmi6OPbpY7kVHa4dr8S49tPwrVMjC
# 3hk9v9S6poDx/hR9kytwVt1Lo4LjAlpmKLeHVmOnn5uenpXqFOJMbTMYmciwHz8y
# WJwZYMKKLJPCGa79xaAkZj9HCop5yPUPccqjyz2i0v/Pt8yFH77s8q86e99O2a+/
# oQIDAQABo4ICNTCCAjEwHwYDVR0jBBgwFoAUaDfg67Y7+F8Rhvv+YXsIiGX0TkIw
# HQYDVR0OBBYEFGmlIp+0bnVEmnOvWcJjnCup9DbsMC4GA1UdEQQnMCWgIwYIKwYB
# BQUHCAOgFzAVDBNVUy1ERUxBV0FSRS00MTUyOTU0MA4GA1UdDwEB/wQEAwIHgDAT
# BgNVHSUEDDAKBggrBgEFBQcDAzCBtQYDVR0fBIGtMIGqMFOgUaBPhk1odHRwOi8v
# Y3JsMy5kaWdpY2VydC5jb20vRGlnaUNlcnRUcnVzdGVkRzRDb2RlU2lnbmluZ1JT
# QTQwOTZTSEEzODQyMDIxQ0ExLmNybDBToFGgT4ZNaHR0cDovL2NybDQuZGlnaWNl
# cnQuY29tL0RpZ2lDZXJ0VHJ1c3RlZEc0Q29kZVNpZ25pbmdSU0E0MDk2U0hBMzg0
# MjAyMUNBMS5jcmwwPQYDVR0gBDYwNDAyBgVngQwBAzApMCcGCCsGAQUFBwIBFhto
# dHRwOi8vd3d3LmRpZ2ljZXJ0LmNvbS9DUFMwgZQGCCsGAQUFBwEBBIGHMIGEMCQG
# CCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wXAYIKwYBBQUHMAKG
# UGh0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFRydXN0ZWRHNENv
# ZGVTaWduaW5nUlNBNDA5NlNIQTM4NDIwMjFDQTEuY3J0MAwGA1UdEwEB/wQCMAAw
# DQYJKoZIhvcNAQELBQADggIBALlYa6PSDPPulVJbqEi7XGz23lFZwYa1PiXk+PkJ
# O2HDXv2zep26LZriwBHT2yA/KbDvbwZpf4VOBKn5lQC9R+DsgwW/xZbNq7y3cWf9
# Ad1AQ9Do/FXfBqVO1if+GpqFbqUme5wOjn8/8dc4nFR4erbDgkM4ICn/astBigYn
# fM5wTO+J8ex+7fE2D1kFAwfZAuiRNdDreVMDlYXpJMQ4CtTKVLHYentLR747zzRj
# O4PqgL1exvbvpOMZlSDLWhaDjtKwUDb645ziHDA3DXe8K51+hIFuadKTinJa8Pfs
# bgg2W7aTfBdi2gTyXkeVJ836631Ks4KD3cXui9Jx2PWRAVxKIEvXuebZ09Mph2ji
# BH75urqS57i1mpS7OA5lIj7a7NIYsVl26PVpJUEr3LRKV8GO3tRC7KP0zE7sB7k2
# VQKwBXbsifq/vpcmeyy4OeQbZ1i8GwZLPHuygP9exTWK2o2wWByJs62Wdk6JmSRE
# vr9Wr59BVNbQfRSRaF9q058bBK68hGZtDBpJ9gJX4V12DI2UpSbcGf10+afL1J4z
# FDv98GIGkgmfLQJUpJeC/FnNrEXJbINndCsOb6gdLvLX1grMdUPmPkpRZyvG3HEy
# EMCV5ODMItTx7K6TDyeZDIXXP5oBnBMK9EjtRD3XkEb9dDfuzCrdlTpEoTElt2mG
# uEE7MYIX1TCCF9ECAQEwfTBpMQswCQYDVQQGEwJVUzEXMBUGA1UEChMORGlnaUNl
# cnQsIEluYy4xQTA/BgNVBAMTOERpZ2lDZXJ0IFRydXN0ZWQgRzQgQ29kZSBTaWdu
# aW5nIFJTQTQwOTYgU0hBMzg0IDIwMjEgQ0ExAhALyko14sGCglkXWPsT8gmbMA0G
# CWCGSAFlAwQCAQUAoHwwEAYKKwYBBAGCNwIBDDECMAAwGQYJKoZIhvcNAQkDMQwG
# CisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZI
# hvcNAQkEMSIEIIggGiiIJe1Hnoajdl4sgBmQ1f6QTids3rxvEr1zUzMYMA0GCSqG
# SIb3DQEBAQUABIIBgH550g+rOs+pD6dlPRG+y+mr7VnNVJuh4JeRhpSI/EPd7+O2
# 8Izms+XjDymqyU1LJFr/WqvQF/nbf3Htxsri67UWbuQkyo/ap9d7ewS19Ta8u3RY
# 2vgtbGSTVyzttngSyM19Z6LTS7C3200s7PkEGEYoTnC4vaaapQll3wS6i8WYznq7
# UTBxFSZoNE5azUzc5LDt7VPw9gVImhGaOtg/k/7rcwMhw6Wb9vb/lMDstTZMPc7j
# HtJSrcTD5tklvPR3QWclsys2d0HDzV5Aof46j+l0e4902gC1mmd+qXF+0CTwBXIJ
# SawjAMK8B3TWKpCAOHXLZ/9OZNdVy/BN4QHkbISfkeGLkJvb3rs1YK3ENPzsCv3l
# LnVx04iq/pA1Yg8pd8zVRoAOLmRrvtRxLAn5N4Ab5PyLI90AD4G7ObVIBJEh5bHA
# uGJrtXg+U9BTYL4R70CQKKm6oBrBQfEx+91z869eoiupsNWb6VheB3V6YNKpgyzj
# j2ca6IBCg0X/V6nmCKGCFSswghUnBgorBgEEAYI3AwMBMYIVFzCCFRMGCSqGSIb3
# DQEHAqCCFQQwghUAAgEDMQ0wCwYJYIZIAWUDBAIBMIH0BgsqhkiG9w0BCRABBKCB
# 5ASB4TCB3gIBAQYKYIZIAYb6bAoDBTAxMA0GCWCGSAFlAwQCAQUABCCK6TF2MnIM
# QEwAAAUxaPNjR9lfQvHgHFziSUivswKXSwIJANIJ1IyFjSIGGA8yMDIyMDYxMDE5
# MDgyMlowAwIBAaB5pHcwdTELMAkGA1UEBhMCQ0ExEDAOBgNVBAgTB09udGFyaW8x
# DzANBgNVBAcTBk90dGF3YTEWMBQGA1UEChMNRW50cnVzdCwgSW5jLjErMCkGA1UE
# AxMiRW50cnVzdCBUaW1lc3RhbXAgQXV0aG9yaXR5IC0gVFNBMaCCD1UwggQqMIID
# EqADAgECAgQ4Y974MA0GCSqGSIb3DQEBBQUAMIG0MRQwEgYDVQQKEwtFbnRydXN0
# Lm5ldDFAMD4GA1UECxQ3d3d3LmVudHJ1c3QubmV0L0NQU18yMDQ4IGluY29ycC4g
# YnkgcmVmLiAobGltaXRzIGxpYWIuKTElMCMGA1UECxMcKGMpIDE5OTkgRW50cnVz
# dC5uZXQgTGltaXRlZDEzMDEGA1UEAxMqRW50cnVzdC5uZXQgQ2VydGlmaWNhdGlv
# biBBdXRob3JpdHkgKDIwNDgpMB4XDTk5MTIyNDE3NTA1MVoXDTI5MDcyNDE0MTUx
# MlowgbQxFDASBgNVBAoTC0VudHJ1c3QubmV0MUAwPgYDVQQLFDd3d3cuZW50cnVz
# dC5uZXQvQ1BTXzIwNDggaW5jb3JwLiBieSByZWYuIChsaW1pdHMgbGlhYi4pMSUw
# IwYDVQQLExwoYykgMTk5OSBFbnRydXN0Lm5ldCBMaW1pdGVkMTMwMQYDVQQDEypF
# bnRydXN0Lm5ldCBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eSAoMjA0OCkwggEiMA0G
# CSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCtTUupEoay6qMgBxUWZCorS9G/C0pN
# ju2AdqVnt3hAwHNCyGjA21Mr3V64dpg1k4sanXwTOg4fW7cez+UkFB6xgamNfbjM
# a0sD8QIM3KulQCQAf3SUoZ0IKbOIC/WHd51VzeTDftdqZKuFFIaVW5cyUG89yLpm
# DOP8vbhJwXaJSRn9wKi9iaNnL8afvHEZYLgt6SzJkHZme5Tir3jWZVNdPNacss8p
# A/kvpFCy1EjOBTJViv2yZEwO5JgHddt/37kIVWCFMCn5e0ikaYbjNT8ehl16ehW9
# 7wCOFSJUFwCQJpO8Dklokb/4R9OdlULBDk3fbybPwxghYmZDcNbVwAfhAgMBAAGj
# QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBRV
# 5IHREYC+2Im5CKMx+aEkCRa5cDANBgkqhkiG9w0BAQUFAAOCAQEAO5uPVpsw51OZ
# fHp5p02X1xmVkPsGH8ozfEZjj5ZmJPpAGyEnyuZyc/JP/jGZ/cgMTGhTxoCCE5j6
# tq3aXT3xzm72FRGUggzuP5WvEasP1y/eHwOPVyweybuaGkSV6xhPph/NfVcQL5sE
# CVqEtW7YHTrh1p7RbHleeRwUxePQTJM7ZTzt3z2+puWVGsO1GcO9Xlu7/yPvaBnL
# EpMnXAMtbzDQHrYarN5a99GqqCem/nmBxHmZM1e6ErCp4EJsk8pW3v5thAsIi36N
# 6teYIcbz5zx5L16c0UwVjeHsIjfMmkMLl9yAkI2zZ5tvSAgVVs+/8St8Xpp26VmQ
# xXyDNRFlUTCCBRMwggP7oAMCAQICDFjaE/8AAAAAUc4N9zANBgkqhkiG9w0BAQsF
# ADCBtDEUMBIGA1UEChMLRW50cnVzdC5uZXQxQDA+BgNVBAsUN3d3dy5lbnRydXN0
# Lm5ldC9DUFNfMjA0OCBpbmNvcnAuIGJ5IHJlZi4gKGxpbWl0cyBsaWFiLikxJTAj
# BgNVBAsTHChjKSAxOTk5IEVudHJ1c3QubmV0IExpbWl0ZWQxMzAxBgNVBAMTKkVu
# dHJ1c3QubmV0IENlcnRpZmljYXRpb24gQXV0aG9yaXR5ICgyMDQ4KTAeFw0xNTA3
# MjIxOTAyNTRaFw0yOTA2MjIxOTMyNTRaMIGyMQswCQYDVQQGEwJVUzEWMBQGA1UE
# ChMNRW50cnVzdCwgSW5jLjEoMCYGA1UECxMfU2VlIHd3dy5lbnRydXN0Lm5ldC9s
# ZWdhbC10ZXJtczE5MDcGA1UECxMwKGMpIDIwMTUgRW50cnVzdCwgSW5jLiAtIGZv
# ciBhdXRob3JpemVkIHVzZSBvbmx5MSYwJAYDVQQDEx1FbnRydXN0IFRpbWVzdGFt
# cGluZyBDQSAtIFRTMTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANkj
# 5hSk6HxLhXFY+/iB5nKLXUbDiAAfONCK4dZuVjDlr9pkUH3CEzn7vWa02oT7g9Ao
# H8t26GBQaZvzzk8T4sE+wd8SyzKj+F5EIg7MOumNSblgdMjeVD1BXkNfKEapprfK
# ECsivFtNW4wXZRKG/Sx31cWgjMrCg+BHV3zncK5iRScxGArUwKQYVVL3YMYES7Pd
# aDJuEB80EbgSeGTx7qng9+OxIo80WmXLivThRVB035OXpjTm0Ew7nzdJUqdTTp8u
# Z1ztlvylv3RRiOOqjr3ZsS9fUDAW9FFgImuZy//hVDu5+0Q4pQg5I5tpR/o8xNDn
# qt9GsuzyihmsKbI4lXUCAwEAAaOCASMwggEfMBIGA1UdEwEB/wQIMAYBAf8CAQAw
# DgYDVR0PAQH/BAQDAgEGMDsGA1UdIAQ0MDIwMAYEVR0gADAoMCYGCCsGAQUFBwIB
# FhpodHRwOi8vd3d3LmVudHJ1c3QubmV0L3JwYTAzBggrBgEFBQcBAQQnMCUwIwYI
# KwYBBQUHMAGGF2h0dHA6Ly9vY3NwLmVudHJ1c3QubmV0MDIGA1UdHwQrMCkwJ6Al
# oCOGIWh0dHA6Ly9jcmwuZW50cnVzdC5uZXQvMjA0OGNhLmNybDATBgNVHSUEDDAK
# BggrBgEFBQcDCDAdBgNVHQ4EFgQUw8Jx0nvXaAWuOzmbNCUMYgPHV2gwHwYDVR0j
# BBgwFoAUVeSB0RGAvtiJuQijMfmhJAkWuXAwDQYJKoZIhvcNAQELBQADggEBAB0k
# 55p0W6pw/LEOMUXXLAB/ZjoroJo0qqxjbYn5n98Nd/0kI/xPnLdvj/P0H7bB/dYc
# xIyIZsFjjbpXd9O4Gh7IUa3MYDYah2oo6hFl3sw8LIx0t+hQQ9PMKOgVbBEqnxSV
# KckFV7VnNug8qYPvQcEhFtN+9y0RR2Z2YIISaYx2VXMP3y9LXelsI/gH9rV91mlF
# nFh9YS78eEtDTomRRkQsoFOoRaH2Fli7kRPyS8XfC8Dnril6vUWz53Aw5zSO63r2
# 07XR3msTmUazi9JNk3W18W+/3AAowiW/vOejZTTsPw0dl4z6qogipBg12wWOduMQ
# yCmPY9CurBjZ2sSfURIwggYMMIIE9KADAgECAhEAjc4V86eUxYcAAAAAVZIz9DAN
# BgkqhkiG9w0BAQsFADCBsjELMAkGA1UEBhMCVVMxFjAUBgNVBAoTDUVudHJ1c3Qs
# IEluYy4xKDAmBgNVBAsTH1NlZSB3d3cuZW50cnVzdC5uZXQvbGVnYWwtdGVybXMx
# OTA3BgNVBAsTMChjKSAyMDE1IEVudHJ1c3QsIEluYy4gLSBmb3IgYXV0aG9yaXpl
# ZCB1c2Ugb25seTEmMCQGA1UEAxMdRW50cnVzdCBUaW1lc3RhbXBpbmcgQ0EgLSBU
# UzEwHhcNMjAwNzIyMTUzMzI5WhcNMzAxMjI5MTYyOTIzWjB1MQswCQYDVQQGEwJD
# QTEQMA4GA1UECBMHT250YXJpbzEPMA0GA1UEBxMGT3R0YXdhMRYwFAYDVQQKEw1F
# bnRydXN0LCBJbmMuMSswKQYDVQQDEyJFbnRydXN0IFRpbWVzdGFtcCBBdXRob3Jp
# dHkgLSBUU0ExMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAyj7sJGLh
# 9/7f0TapN2bWeRcUlEIApIaXuCeM60+p99Ou4qswBAgoX5tTpoeKLd0CUl+1uOW2
# UPCcqxLB7hpWeIpuRD+pio/X21PZxkfIDNxGVwBnBhcahbdAqq92B+eQX5SS1a7W
# 1815ocU1K0SEX0kc1XO4gY1ylAJqqc9Wkqo2lMNQyVaXiFzhf1/9+98Ujj2rJA32
# e49q+m4e+pW9fZD45EIUv1VeBFSTMUP3w+fCBRForEBpxyM37FpMKcnfNbN+SU7G
# etvOwiWUnjc/iOwkTTmPf+8Va1RMcfENIXxaddCHU4mgW+Ad+5wHwKihtCLQYqTH
# F383Ts4tOljj5fAmhk1CB5++o+IZomtypUa/y2RbJchF9N7oPLb9nPOg74NBfDZw
# kMNSYrDHfz175ZaHpVb/DupJBd+03RNvRdObyCN5KjCZnZnczM2lLoFTUiLy0D2i
# N1KRkUZw1sVLBf9O9NxkBpf+fJCGJ6+fNFVIiasiwHUHjCHZBNMcp+ptpMlSK+LE
# AokwXuebMeY5Za1xre9nW9yjJO0N5uKpejoYVd7wRi40TRpNmIANTtFshXW4A8IA
# 1SJKJtGO3e211CfWOnxnaYbXVD+Xz2S+katutp0ZEHm1lw700YXJ5K7HwLSqB8Qf
# wTpXn80OpnrlFYayqvSikyzPjPdR+t2M0EkCAwEAAaOCAVcwggFTMA4GA1UdDwEB
# /wQEAwIHgDAWBgNVHSUBAf8EDDAKBggrBgEFBQcDCDBBBgNVHSAEOjA4MDYGCmCG
# SAGG+mwKAwUwKDAmBggrBgEFBQcCARYaaHR0cDovL3d3dy5lbnRydXN0Lm5ldC9y
# cGEwCQYDVR0TBAIwADBoBggrBgEFBQcBAQRcMFowIwYIKwYBBQUHMAGGF2h0dHA6
# Ly9vY3NwLmVudHJ1c3QubmV0MDMGCCsGAQUFBzAChidodHRwOi8vYWlhLmVudHJ1
# c3QubmV0L3RzMS1jaGFpbjI1Ni5jZXIwMQYDVR0fBCowKDAmoCSgIoYgaHR0cDov
# L2NybC5lbnRydXN0Lm5ldC90czFjYS5jcmwwHwYDVR0jBBgwFoAUw8Jx0nvXaAWu
# OzmbNCUMYgPHV2gwHQYDVR0OBBYEFC1WgO+O90pDHEOhtd7Z16iqayYoMA0GCSqG
# SIb3DQEBCwUAA4IBAQBYS87Y/oHXUdjHXI2S0k6VHoWGQ+3gGuaaIUIzXeORvvhQ
# fHaMJalB1ISZ6OiitpmXaKIgvTKoqil8CnYan8hVjqvTe9Tjfll+knA5D+32L/NP
# /3Rc8+cwNECjEaNrcqQyEQV8/ZGLR6hXNlLH+rVFhNGyPkLlFl7dA9Op/T1wZ3ra
# E+CEgmc4YFbDrbCI4Qo3fmKBBrsjBO9YoCOo0QljMM3ZGTj061p3WL5fv+uULf8v
# BDBkEI8+WVYuOjZPDjyWD4/J6n5/STIfo19u2iKf19kXOVneSBd6AktYcf+3DC2h
# 8GejEdz3ybzZHstsDBUneEgWayzxrZe4dWy7lcOOMYIEmjCCBJYCAQEwgcgwgbIx
# CzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1FbnRydXN0LCBJbmMuMSgwJgYDVQQLEx9T
# ZWUgd3d3LmVudHJ1c3QubmV0L2xlZ2FsLXRlcm1zMTkwNwYDVQQLEzAoYykgMjAx
# NSBFbnRydXN0LCBJbmMuIC0gZm9yIGF1dGhvcml6ZWQgdXNlIG9ubHkxJjAkBgNV
# BAMTHUVudHJ1c3QgVGltZXN0YW1waW5nIENBIC0gVFMxAhEAjc4V86eUxYcAAAAA
# VZIz9DALBglghkgBZQMEAgGgggGmMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0BCRAB
# BDAcBgkqhkiG9w0BCQUxDxcNMjIwNjEwMTkwODIyWjApBgkqhkiG9w0BCTQxHDAa
# MAsGCWCGSAFlAwQCAaELBgkqhkiG9w0BAQswLwYJKoZIhvcNAQkEMSIEINi9SZYG
# 1MtPBPcQ1QlU9MJgBxOrGbl+D1/rOwSYR/iGMIIBDAYLKoZIhvcNAQkQAi8xgfww
# gfkwgfYwgfMEIJUKJv3HwCAY6feRqVw48m7vPaQyZ8qwzRWlVa9jEHLJMIHOMIG4
# pIG1MIGyMQswCQYDVQQGEwJVUzEWMBQGA1UEChMNRW50cnVzdCwgSW5jLjEoMCYG
# A1UECxMfU2VlIHd3dy5lbnRydXN0Lm5ldC9sZWdhbC10ZXJtczE5MDcGA1UECxMw
# KGMpIDIwMTUgRW50cnVzdCwgSW5jLiAtIGZvciBhdXRob3JpemVkIHVzZSBvbmx5
# MSYwJAYDVQQDEx1FbnRydXN0IFRpbWVzdGFtcGluZyBDQSAtIFRTMQIRAI3OFfOn
# lMWHAAAAAFWSM/QwCwYJKoZIhvcNAQELBIICAAbqWypXGL1epR3LFvH1vL9FWZ+R
# rOxZVfOKVZ26UyFNQ7Inbm0zXY8Kk3ulQexnX3/+oYMGSYIuKLKveDbwXx5vk6lI
# x3wXNlxmRntII94FWqmOck/SdUh8OwRmkGm/8WKVwFunDf2B1ZBPJue2odAIrk1Q
# xmFTp23VQIWlaq20ObytLWmeZulAPn83BfvMVWEG6crA0B7qfoZambN5UVS+uo0R
# Oz+yBwczapdJTBp9XRbxKp3BnXQGK/zMWqAt45YW6L+zwrdKp38AD9178f+NYTk7
# JGIafnYjLsxE0ZnyX9qFCH9di7nIdLnhpztSFpG6Zz9T0OxNHuf/KjYSK0m4szUp
# EZ7hlMtLn/FGwH1ap6UMeZMWueruPTRPXkxpGSh0Y3h4TMbslQ+LtfMaxLxRuJgF
# 6yaIiJz9BxSEqa0mSmWWHo6QS+1VA6p3k9NJXk6vf8gkNbMmOrZhx8VjCUZDJ3v4
# d9YEEHLlWRRlvq3j6p7vOfBLPVD3AH+33qtJHgMhs4yP3Y1cttr80x/JAQhpoNXs
# I3GLaoB21/6ZOGzYM8UJw3AHumS0c0rNAAQMjjpF+ZjHcUJJ+k2XQikDq9XgOjic
# 1CQg0Jbx8VDoLhCMWHM9S8UGp/NdwKivu/vYeAkKKkJl40MSIjRls+Snzy3PYqWU
# NTs3sHGoKj1XLx38
# SIG # End signature block
