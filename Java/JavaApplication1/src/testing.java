/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author noeln
 */
import java.util.Scanner;

class Linklist {
	private apples first;
	public  Linklist(){
		first=null;
		
	}
	
	public boolean isEmpty(){
		return first==null;
	}
	
	public void insert(int d1,int d2){
		apples apple= new apples(d1,d2);
		apple.nextone=first;
		first=apple;
	}
	public apples delete(){
		apples temp=first;
		first=first.nextone;
		return temp;
	}
	
	public void printlist(){
		apples currentone=first;
		System.out.println("List:");
		while(currentone !=null) {
			currentone.printlink();
			currentone=currentone.nextone;
		}
		
	}
	
}

class testing{
	public static void main(String[] args){
		Scanner noel=new Scanner(System.in);
		Linklist l= new Linklist();
		int option=0;
		System.out.println("1. Add 2.Delete 3.Show 0. exit");
		option=noel.nextInt();
		while(option!=0){
			switch(option){
			case 1:
				System.out.println("enter the number");
				int c=noel.nextInt();
				System.out.println("enter the character");
				int d=noel.nextInt();
				l.insert(c,d);
				break;
			case 2:
				apples z=l.delete();
				z.printlink();
				break;
			case 3:
				l.printlist();
				break;
			}
				
			System.out.println("1. Add 2.Delete 3.Show 0. exit");
			option=noel.nextInt();	
		}
		noel.close();
		
	}
}
        