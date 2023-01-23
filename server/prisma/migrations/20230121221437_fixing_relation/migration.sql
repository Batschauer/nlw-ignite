/*
  Warnings:

  - You are about to drop the column `dayId` on the `day_habit` table. All the data in the column will be lost.
  - You are about to drop the column `habitId` on the `day_habit` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_day_habit" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "day_id" TEXT NOT NULL,
    "habit_id" TEXT NOT NULL,
    CONSTRAINT "day_habit_day_id_fkey" FOREIGN KEY ("day_id") REFERENCES "day" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "day_habit_habit_id_fkey" FOREIGN KEY ("habit_id") REFERENCES "habits" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_day_habit" ("day_id", "habit_id", "id") SELECT "day_id", "habit_id", "id" FROM "day_habit";
DROP TABLE "day_habit";
ALTER TABLE "new_day_habit" RENAME TO "day_habit";
CREATE UNIQUE INDEX "day_habit_day_id_habit_id_key" ON "day_habit"("day_id", "habit_id");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
