import std.stdio : writeln;
import dddb;

void main() {
  auto db = new ddb("yes.db");

  db.set("social_networks", "facebook");
  db.set("social_networks", "twitter");
  db.set("social_networks", "kakaotalk");

  writeln(db.get("social_networks"));

  writeln(db.count("social_networks"));

  db.update("social_networks", "facebook", "instagram");

  writeln(db.get("social_networks"));

  writeln(db.getkeys());

  writeln(db.havevalue("social_networks", "facebook"));
}
