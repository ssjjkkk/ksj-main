package e_oop.myGame;

import java.util.Scanner;

public class MyGame {

	public static void main(String[] args) {
		/*
		 * 거지키우기 게임을 만들어 봅시다.
		 */
		
		Scanner sc = new Scanner(System.in);
		Beggar b = new Beggar("거지왕", 0, 1);
		
		game : while(true) {
			System.out.println("1. 상태확인  2. 돈벌기  3. 쇼핑  0. 종료");
			int input = Integer.parseInt(sc.nextLine());
			switch (input) {
			case 1:
				b.showInfo();
				break;
			case 2:
				b.getMoneyManagerList();
				break;
			case 3:
				
				break;
			case 0:
				System.out.println("┎━━━━━━━━━━━━━━━━━━━━━━━━┒");
				System.out.println("┃   <<< 게임을 종료합니다  >>>  ┃");
				System.out.println("┖━━━━━━━━━━━━━━━━━━━━━━━━┚");
				break game;
			default :
				break;
			}
		}

		
		
	}

}
