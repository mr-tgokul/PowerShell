$msgBoxInput =  [System.Windows.MessageBox]::Show('Would you like to play a game?','Game  input','YesNoCancel','Error')

  switch  ($msgBoxInput) {

  'Yes' {

  ## Do something  
       Write-Host "You have clicked Yes" -ForegroundColor Green

  }

  'No' {

  ## Do something

  Write-Host "You have clicked No" -ForegroundColor Red

  }

  'Cancel' {

  ## Do something

  Write-Host "You have clicked Cancel" -ForegroundColor Yellow
  }

  }