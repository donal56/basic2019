<?php
use app\components\widgets\krnpanel\KrnPanel;


$this->title = 'Sistema del ITVH';
?>
<br/>
<?php 
  
echo KrnPanel::widget([ 'buttons'=>$botones]);

