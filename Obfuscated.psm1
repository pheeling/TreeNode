function Get-Obfuscated(){
    return [TreeNode]::new()
}

class TreeNode  {

    hidden $left = [TreeNode]::New
    hidden $right = [TreeNode]::New
    hidden $leftCounter = 0
    hidden $rightCounter = 0
    hidden $print = ""

    [System.Object] fulltreesWithNLeaves([int] $number){
        if($number -eq 1){
            $list = [System.Collections.ArrayList]::New()
            $treeNode = [TreeNode]::New
            return $list.Add($treeNode)
        } else {
            $result = [System.Collections.ArrayList]::New()
            $result.add([TreeNode]::New)
            for ($leftLeaves = 1; $leftLeaves -lt $number; $leftLeaves++){
                [int] $rightLeaves = $number - $leftLeaves;
                $leftTrees = [System.Collections.ArrayList]::New()
                $leftTrees.Add($this.fulltreesWithNLeaves($leftLeaves))
                $rightTrees = [System.Collections.ArrayList]::New()
                $rightTrees.Add($this.fulltreesWithNLeaves($rightLeaves))
                foreach ($left in $leftTrees){
                    Write-host $this.visualization($this.leftCounter)
                    foreach ($right in $rightTrees){
                        Write-host $this.visualization($this.rightCounter)
                        $root = [TreeNode]::New()
                        $root.left = $this.left
                        $root.right = $this.right
                        $result.add($root)
                        $this.rightCounter = $this.rightCounter + 1
                    }
                    $this.leftCounter = $this.leftCounter + 1
                }
            }
        }
        return $result
    }

    [String] visualization($number){
        for($i = 1;$i -le $number;$i++){
            $this.print = $this.print + "-"
        }
        return $this.print        
    }
}
