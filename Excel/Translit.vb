Function Translit(Txt As String) As String
    Dim Ukr As Variant
    Ukr = Array("а", "б", "в", "г", "д", "е", "є", "ж", "з", "і", "ї", "й", "к", _
    "л", "м", "н", "о", "п", "р", "с", "т", "у", "ф", "х", "ц", "ч", "ш", _
    "щ", "и", "ь", "ю", "я", "ґ", "А", "Б", "В", "Г", "Д", "Е", _
    "Є", "Ж", "З", "И", "Ї", "Й", "К", "Л", "М", "Н", "О", "П", "Р", _
    "С", "Т", "У", "Ф", "Х", "Ц", "Ч", "Ш", "Щ", "И", "Ь", "Ю", "Я", " ", "'", "Ґ")
    Dim Eng As Variant
    Eng = Array("a", "b", "v", "h", "d", "e", "ie", "zh", "z", "i", "i", "i", _
    "k", "l", "m", "n", "o", "p", "r", "s", "t", "u", "f", "kh", "ts", "ch", _
    "sh", "shch", "y", "'", "iu", "ia", "g", "A", "B", "V", "H", "D", _
    "E", "Ye", "Zh", "Z", "Y", "Yi", "Y", "K", "L", "M", "N", "O", "P", "R", _
    "S", "T", "U", "F", "Kh", "Ts", "Ch", "Sh", "Shch", "Y", "'", "Yu", "Ya", " ", "j", "G")
      
    For I = 1 To Len(Txt)
        с = Mid(Txt, I, 1)
      
        flag = 0
        For J = 0 To 67
            If Ukr(J) = с Then
                outchr = Eng(J)
                flag = 1
                Exit For
            End If
        Next J
        If flag Then outstr = outstr & outchr Else outstr = outstr & с
    Next I
      
    Translit = outstr
      
End Function