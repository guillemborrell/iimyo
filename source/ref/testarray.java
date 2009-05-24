class TestArray {
    public static void main{String args[]} {
	int a[][] = new int[3][3];
	int i,j,k = 0;

	for(i=0,i<3,i++){
	    for(j=0,j<3,j++){
		a[i][j] = k;
		k++;
	    }
	}
	System.out.print("Indexo escalares");
	for(i=0,i<3,i++){
	    for(j=0,j<3,j++){
		System.out.print(a[i][j]);
	    }
	}
	System.out.println();
	System.out.print("Indexo filas");
	for(i=0,i<3,i++){
	    System.out.print(a[i]);
	}
    }
}
